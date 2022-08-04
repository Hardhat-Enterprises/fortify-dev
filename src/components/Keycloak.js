import Keycloak from "keycloak-js";
const keycloak = new Keycloak({
 url: "http://dubstation:8080/",
 realm: "fortify",
 clientId: "fortify-react",
});

export default keycloak;