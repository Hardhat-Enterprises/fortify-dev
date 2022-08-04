import { useState, useEffect } from "react";

function Organization() {
  const initialValues = { username: "", email: "",password: "" };
  const [formValues, setFormValues] = useState(initialValues);
  const [formErrors, setFormErrors] = useState({});
  const [isSubmit, setIsSubmit] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormValues({ ...formValues, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    setFormErrors(validate(formValues));
    setIsSubmit(true);
  };

  useEffect(() => {
    console.log(formErrors);
    if (Object.keys(formErrors).length === 0 && isSubmit) {
      console.log(formValues);
    }
  }, [formErrors]);
  const validate = (values) => {
    const errors = {};
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/i;
    if (!values.username) {
      errors.username = "Username is required!";
    }
    if (!values.email) {
      errors.email = "Email is required!";
    } else if (!regex.test(values.email)) {
      errors.email = "This is not a valid email format!";
    }
    if (!values.password) {
      errors.password = "Password is required";
    } else if (values.password.length < 4) {
      errors.password = "Password must be more than 4 characters";
    } else if (values.password.length > 10) {
      errors.password = "Password cannot exceed more than 10 characters";
    }
    return errors;
  };

//const Organization = () => {
    return (
      
    <form onSubmit={handleSubmit} class="form">
    <h1>Join Our Community</h1>
        <div className="ContainerForm"></div>
        <div className="ui form">
          <div className="field">
          </div>
            <div class="col-25">
            <label>Business Name</label>
            </div>
            <div class="col-75">
            <input
              type="text"
              name="username"
              placeholder="Business Name"
              value={formValues.username}
              onChange={handleChange}
            />
          </div>
          <p class="p">{formErrors.username}</p>
          <div className="field">
          </div>
            <div class="col-25">
            <label>Email</label>
            </div>
            <div class="col-75">
            <input
              type="text"
              name="email"
              placeholder="Email"
              value={formValues.email}
              onChange={handleChange}
            />
          </div>
          <p class="p">{formErrors.email}</p>

          <div className="field">
          </div>
            <div class="col-25">
            <label>Contact Number</label>
            </div>
            <div class="col-75">
            <input
              type="text"
              name="cnumber"
              placeholder="Contact Number"
            />
          </div>
          <p class="p">{formErrors.number}</p>

          <div className="field">
          </div>
            <div class="col-25">
            <label>Password</label>
            </div>
            <div class="col-75">
            <input
              type="password"
              name="password"
              placeholder="Password"
              value={formValues.password}
              onChange={handleChange}
            />
          </div>
          <p class="p">{formErrors.password}</p>
          <button className="fluid ui button blue">Submit</button>
        </div>
      </form>
    );
  //};
}
export default Organization;