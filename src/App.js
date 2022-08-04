import './css/App.css';
import './css/volunteer.css'; 
import './css/bootstrap.min.css';
import { ReactKeycloakProvider } from "@react-keycloak/web";
import keycloak from "./components/Keycloak";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import NavbarComp from './components/NavbarComp';
import WelcomePage from "./pages/Home";
import SecuredPage from "./pages/Securedpage";
import Organization from "./pages/Organization";
import Volunteer from "./pages/Volunteer";

import About from "./pages/about";
import PrivateRoute from "./helpers/PrivateRoute";
import Footer from './components/Footer';

function App() {
  return (
    <div className="App">
      <ReactKeycloakProvider authClient={keycloak}>
        <NavbarComp />
        <BrowserRouter>
          <Routes>
            <Route exact path="/" element={<WelcomePage />} />
            <Route path="/organization" element={<Organization />} />
            <Route path="/volunteer" element={<Volunteer />} />
            <Route path="/about" element={<About />} />
            <Route path="/secured" element={
              <PrivateRoute>
                <SecuredPage />
              </PrivateRoute>
            } />
          </Routes>
        </BrowserRouter>
      </ReactKeycloakProvider>
      <Footer />
    </div>
  );
}

export default App;
