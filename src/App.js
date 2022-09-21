import React, {useEffect, useState} from "react";
import './css/App.css';
import './css/volunteer.css'; 
import './css/bootstrap.min.css';
import { BrowserRouter, Route, Routes} from "react-router-dom";
import NavbarComp from './components/NavbarComp';
import Home from "./pages/homePage";
import Organization from "./pages/Organization";
import Volunteer from "./pages/Volunteer";
import About from "./pages/about";
import Footer from './components/Footer';
import Login from "./pages/loginPage";
import Register from "./pages/registerPage";
import Protected from "./pages/ProtectedPage";


function App() {
  const [name, setName] = useState('');

  useEffect( () => {
    (
      async () => {
        const response = await fetch('http://localhost:8000/api/user', {
          headers: {'Content-Type': 'application/json'},
          credentials:'include',
        });

        const content = await response.json();

        setName(content.name);
      }

    )();
  });


  return (
    <div className="App">
        <NavbarComp name={name} setName={setName}/>
        <BrowserRouter>
          <Routes>
            <Route exact path="/" element={<Home />} />
            <Route path="/organization" element={<Organization />} />
            <Route path="/volunteer" element={<Volunteer />} />
            <Route path="/about" element={<About />} />
            <Route path="/register" element={<Register />} />
            <Route path="/login" element={<Login setName={setName}/>} />
            <Route path="/protected" element={<Protected name={name}/>}/>
          </Routes>
        </BrowserRouter>
      <Footer />
    </div>
  );
}

export default App;