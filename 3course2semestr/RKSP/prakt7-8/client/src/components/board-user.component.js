import React, { Component } from "react";

import UserService from "../services/user.service";
import EventBus from "../common/EventBus";

export default class BoardUser extends Component {
  constructor(props) {
    super(props);

    this.state = {
      content: ""
    };
  }

  componentDidMount() {
    UserService.getUserBoard().then(
      response => {
        this.setState({
          content: response.data.message,
          agrs: response.data.agrs
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

  render() {
    return (
      <div className="container">
        <header className="jumbotron">
          <h3>{this.state.content}</h3>
        </header>
        {Array.isArray(this.state.agrs) &&  this.state.agrs.length > 0 ? (
          <div>
            <h4>Agrs:</h4>
            <ul className="list-group">
              {this.state.agrs.map((agr, index) => (
                <li key={index} className="list-group-item">
                  <div className="d-flex justify-content-between align-items-center">
                    <span>{`Name: ${agr.name}`}</span>
                    <span>{`Status: ${agr.status}`}</span>
                  </div>
                </li>
              ))}
            </ul>
          </div>
        ) : (
          <p>No agrs available.</p>
        )}
      </div>
    );
  }
}
