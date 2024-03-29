import React, { Component } from "react";

import UserService from "../services/user.service";
import EventBus from "../common/EventBus";
import AgrService from "../services/agr.service";


export default class BoardAdmin extends Component {
  constructor(props) {
    super(props);

    this.state = {
      content: ""
    };
  }

  componentDidMount() {
    UserService.getAdminBoard().then(
      response => {
        this.setState({
          content: response.data.message,
          agrs: response.data.agrs || [],
          editedAgrs: Array(response.data.agrs.length).fill(false)
        });
      },
      error => {
        this.setState({
          content:
            (error.response &&
              error.response.data &&
              error.response.data.message) ||
            error.message ||
            error.toString()
        });

        if (error.response && error.response.status === 401) {
          EventBus.dispatch("logout");
        }
      }
    );
  }

  handleRemove(index) {
    const agrId = this.state.agrs[index].id;

    AgrService.deleteAgr(agrId)
      .then(() => {
        const agrs = [...this.state.agrs];
        agrs.splice(index, 1);
        this.setState({ agrs });
      })
      .catch((error) => {
        console.error("Error removing agr:", error);
      });
  }
  handleCreate() {
    AgrService.createAgr({ name: `Agr${this.state.agrs.length + 2}`, status: "Waiting" })
      .then((newAgr) => {
        const agrs = [...this.state.agrs, newAgr];
        this.setState({ agrs });
      })
      .catch((error) => {
        console.error("Error creating agr:", error);
      });
  }

  handleEdit(index) {
    const editedAgrs = [...this.state.editedAgrs];
    const agrToEdit = { ...this.state.agrs[index] }; // Copy the agr to edit
    editedAgrs[index] = agrToEdit;
    this.setState({ editedAgrs });
  }
  
  handleInputChange(index, event) {
    const editedAgrs = [...this.state.editedAgrs];
    editedAgrs[index] = { ...editedAgrs[index], [event.target.name]: event.target.value };
    this.setState({ editedAgrs });
  }

  handleUpdate(index) {
    const { id, name, status } = this.state.editedAgrs[index];

    const updatedData = { name, status };

    AgrService.updateAgr(id, updatedData)
    .then((updatedAgr) => {
      const agrs = [...this.state.agrs];
      agrs[index] = updatedAgr;

      const editedAgrs = [...this.state.editedAgrs];
      editedAgrs[index] = false;

      this.setState({ agrs, editedAgrs });
    })
    .catch((error) => {
      console.error("Error updating agr:", error);
    });
  }

  render() {
    return (
      <div className="container">
        <header className="jumbotron">
          <h3>{this.state.content}</h3>
        </header>
        {Array.isArray(this.state.agrs) && this.state.agrs.length > 0 ? (
        <div>
          <h4>Agrs:</h4>
          <ul className="list-group">
            {this.state.agrs.map((agr, index) => (
              <li key={index} className="list-group-item">
                <div className="d-flex justify-content-between align-items-center">
                  {this.state.editedAgrs[index] ? (
                    <div>
                      <input
                        type="text"
                        name="name"
                        value={this.state.editedAgrs[index].name || agr.name}
                        onChange={(event) => this.handleInputChange(index, event)}
                      />
                      <input
                        type="text"
                        name="status"
                        value={this.state.editedAgrs[index].status || agr.status}
                        onChange={(event) => this.handleInputChange(index, event)}
                      />
                      <button onClick={() => this.handleUpdate(index)}>Update</button>
                    </div>
                  ) : (
                    <>
                      <span>{`Name: ${agr.name}`}</span>
                      <span>{`Status: ${agr.status}`}</span>
                      <button onClick={() => this.handleEdit(index)}>Edit</button>
                      <button onClick={() => this.handleRemove(index)}>Remove</button>
                    </>
                  )}
                </div>
              </li>
            ))}
          </ul>
          <button onClick={() => this.handleCreate()}>Create New Agr</button>
        </div>
      ) : (
        <p>No agrs available.</p>
      )}
      </div>
    );
  }
}