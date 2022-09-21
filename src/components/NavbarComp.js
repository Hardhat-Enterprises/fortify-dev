import React from 'react';
import {Navbar, Nav, Form, FormControl, Button} from 'react-bootstrap';
import logo from '../img/logo.png';

const NavbarComp = (props) => {
  const logout = async () => {
      await fetch('http://localhost:8000/api/logout', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          credentials: 'include',
      });
      props.setName('');
  }

    return (   
      <div>
      <Navbar collapseOnSelect expand="lg" bg="light" variant="light">
            <Navbar.Brand href="/">
              <img
                alt=""
                src={logo}
                width="35"
                height="33"
                className="d-inline-block align-top"
              />{' '}
              Help Fortify
            </Navbar.Brand>
            <Navbar.Toggle aria-controls="responsive-navbar-nav" />
            <Navbar.Collapse id="responsive-navbar-nav">
              <Nav
              className="d-flex align-right"
              style={{ maxHeight: '100px', flex: 1 }}>

              <Nav.Link href="/">Home</Nav.Link>
              <Nav.Link href="/organization">Organization</Nav.Link>
              <Nav.Link href="/volunteer">Volunteer</Nav.Link>
              <Nav.Link href="/about">About</Nav.Link>

              <Form className="d-flex ms-auto"
                >
                  <FormControl
                    type="search"
                    placeholder="Search"
                    className="me-2"
                    aria-label="Search"
                  />
                  <Button variant="outline-success" className="btn-margin-right"> Search </Button>
                </Form>

                <Button href="/register" variant="primary" className="btn-margin-left">Register</Button>
                <Button href="/login" variant="primary" className="btn-margin-left">Login</Button>
                <Button href="/login" variant="primary" className="btn-margin-left" onClick={logout}>Logout</Button>
              </Nav>
              </Navbar.Collapse>
      </Navbar>
      </div>
      )
  }
  export default NavbarComp;