import axios from 'axios';
import React, { useState } from 'react'
import swal from 'sweetalert'
import Navigation from './Navigation';
import { Card } from 'primereact/card';
import { Button } from 'primereact/button';
import { InputText } from 'primereact/inputtext';
import { Link, useHistory } from 'react-router-dom/cjs/react-router-dom.min'


function Login() {

    const [LoginData, setLogin] = useState({
        username: "",
        password: "",
        error: [],
    });
    const [loading, setLoading] = useState(false);
    const history = useHistory();
    

    const handleinput = (e) => {
        e.persist();
        setLogin({ ...LoginData, [e.target.name]: e.target.value });
    }

    const LogingIn = (e) => {
        e.preventDefault();
        setLoading(true)
        const data = {
            username: LoginData.username,
            password: LoginData.password,
        };

        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post(`/api/Login`, data).then(res => {
                if (res.data.status === 200) {
                    // Admin
                    if (res.data.role === 1) {
                        localStorage.setItem("auth_token", res.data.token);
                        localStorage.setItem("auth_id", res.data.id);
                        swal('Success', res.data.message, 'success')
                        history.push('/admin');
                    }
                    // User
                    else {
                        localStorage.setItem("auth_token", res.data.token);
                        localStorage.setItem("auth_id", res.data.id);
                        swal('Success', res.data.message, 'success')
                        history.push('/user');
                    }
                }
                else if (res.data.status === 501) {
                    setLogin({ ...LoginData, error: res.data.error });
                }
                setLoading(false);
            }).catch((error) => {
                if (error.response.status === 500) {
                    swal("Warning", error.response.statusText, 'warning');
                    setLoading(false)
                }
            })
        });
    }

    const bannertext = <div className='p-3'>
        <h2 className="text-center">
            Login
        </h2>
    </div>

    return (
        <div>
            <Navigation />
            <div className="mt-5">
                <div className="container">
                    <div className="row justify-content-center align-items-center">
                        <div className="col-lg-6">
                            <Card header={bannertext}>
                                <form onSubmit={LogingIn}>
                                    <div className="row">
                                        <div className="col-lg-12 mb-2">
                                            <label htmlFor="username" className="form-label">
                                                Email
                                            </label>
                                            <InputText className='p-inputtext-sm w-100' value={LoginData.username} name='username' onChange={handleinput} />
                                            <span className='text-danger'>{LoginData.error.username}</span>
                                        </div>
                                        <div className="col-lg-12 mb-2">
                                            <label htmlFor="username" className="form-label">
                                                Password
                                            </label>
                                            <InputText className='w-100' type='password' onChange={handleinput} name='password' />
                                            <span className='text-danger'>{LoginData.error.password}</span>
                                        </div>
                                        <div className="mt-3">
                                            <Button loading={loading} className='p-button-sm p-button-info w-100' label='Login' />
                                        </div>
                                    </div>
                                </form>
                            </Card>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Login