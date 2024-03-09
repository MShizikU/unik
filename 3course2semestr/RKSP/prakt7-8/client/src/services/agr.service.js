import axios from "axios";
import authHeader from "./auth-header";

const API_URL = "http://localhost:8080/api/test/";

class AgrService {

    updateAgr(agrId, updatedAgr){
        const updateUrl = `${API_URL}agrs/${agrId}`;
        
        return axios.put(updateUrl, updatedAgr, { headers: authHeader() })
            .then((response) => {
                return response.data;
            })
            .catch((error) => {
                throw error;
            });
    }

    createAgr(newAgrData) {
        const createUrl = `${API_URL}agrs`; 
    
        return axios.post(createUrl, newAgrData, { headers: authHeader() })
          .then((response) => {
            const createdAgr = response.data;
            return createdAgr;
          })
          .catch((error) => {
            throw error;
          });
    }

      deleteAgr(agrId) {
        const deleteUrl = `${API_URL}agrs/${agrId}`;
        console.log(authHeader());
        return axios.delete(deleteUrl, { headers: authHeader() })
          .then(() => {
            return { message: 'Agr deleted successfully' };
          })
          .catch((error) => {
            throw authHeader();
            throw error;
          });
    }
}

export default new AgrService();
