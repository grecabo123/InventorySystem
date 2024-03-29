import React, { useEffect, useState } from 'react'
import { Link, Redirect, Route, Switch, useHistory } from 'react-router-dom/cjs/react-router-dom.min'
import AdminRoutes from '../../routes/AdminRoutes'
import { FcCalendar, FcSurvey, FcOpenedFolder, FcHome, FcSms, FcPositiveDynamic, FcManager, FcHighPriority, FcCheckmark, FcFolder, FcFeedback, FcBiohazard, FcAssistant, FcComboChart, FcOk, FcBookmark, FcInfo, FcShare, FcDownload, FcDepartment, FcFile } from 'react-icons/fc'
import { FaArchive, FaBars, FaBox, FaBuilding, FaCalculator, FaCalendar, FaCalendarCheck, FaCalendarPlus, FaCaretDown, FaCaretRight, FaChartLine, FaClock, FaCogs, FaDatabase, FaDeskpro, FaDesktop, FaDollarSign, FaEnvelope, FaFolder, FaFolderOpen, FaHeart, FaHome, FaMoneyBill, FaPen, FaPenAlt, FaStore, FaUserAlt, FaUsers } from 'react-icons/fa'
import { HiOutlineX } from "react-icons/hi";
import { BiLogOut } from 'react-icons/bi'
import UserRoutes from '../../routes/UserRoutes'
import axios from 'axios'
import swal from 'sweetalert'
import { Skeleton } from 'primereact/skeleton'

function User() {

    const history = useHistory();
    const [DetailsStore, setDetails] = useState([]);
    const [loading, setLoading] = useState(true)

    useEffect(() => {
        axios.get(`/api/StoreDetails/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {
                setDetails(res.data.data);
            }
            setLoading(false)
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    },[]);

    

    const Logout = () => {
        axios.post(`/api/logout`).then(res => {
            if (res.data.status === 200) {
                localStorage.removeItem('auth_token');
                localStorage.removeItem('auth_id');
                localStorage.removeItem('auth_name');
                swal('Success', res.data.message, 'success');
                history.push('/');
            }
        });
    }
    

    return (
        <>
            <div class="sidebar sidebar-dark sidebar-fixed" id="sidebar">
                <div class="sidebar-brand d-none d-md-flex">
                    <h5 className='text-center'> {loading ? <Skeleton /> : <span>Store {DetailsStore.store_name}</span>} <br /> </h5>
                </div>
                <ul class="sidebar-nav" data-coreui="navigation" data-simplebar="">
                    <li class="nav-item"><a class="nav-link fs-5">
                    </a></li>
                    <li class="nav-title">Pages</li>
                    <li class="nav-item"><a class="nav-link" href="/user">
                        <FcHome className='nav-icon' /> Dashboard</a></li>

                    <li class="nav-group"><a class="nav-link nav-group-toggle" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                        <FcManager className='nav-icon' />Employee</a>
                    </li>
                    <div class="collapse" id='collapseOne'>
                        <li class="nav-item"><Link class="nav-link" to="/user/employee"><FcFolder className='nav-icon' /> Registered</Link></li>
                        {/* <li class="nav-item"><Link class="nav-link" to="/user/pending"><HiOutlineX className='nav-icon text-danger' /> Non Registered</Link></li> */}
                    </div>
                    <li class="nav-group"><a class="nav-link nav-group-toggle" data-bs-toggle="collapse" data-bs-target="#stores">
                        <FaStore className='nav-icon' />Product</a>
                    </li>
                    <div class="collapse" id='stores'>
                        <li class="nav-item"><Link class="nav-link" to="/user/transfer"><FcInfo className='nav-icon' />Transfer</Link></li>
                        <li class="nav-item"><Link class="nav-link" to="/user/monitor"><FcComboChart className='nav-icon text-danger' />Stock Monitoring</Link></li>
                        {/* <li class="nav-item"><Link class="nav-link" to="/user/request"><FcBookmark className='nav-icon text-danger' />Request</Link></li> */}
                        {/* <li class="nav-item"><Link class="nav-link" to="/user/sold"><FcOk className='nav-icon text-danger' />Sold</Link></li> */}
                    </div>
                    <li class="nav-group"><a class="nav-link nav-group-toggle" data-bs-toggle="collapse" data-bs-target="#branch">
                        <FcDepartment className='nav-icon' />Branch To Branch</a>
                    </li>
                    <div class="collapse" id='branch'>
                        <li class="nav-item"><Link class="nav-link" to="/user/branch"><FcShare className='nav-icon text-danger' />Transfer Product</Link></li>
                        <li class="nav-item"><Link class="nav-link" to="/user/branch/monitor"><FcComboChart className='nav-icon text-danger' />Monitoring</Link></li>
                        <li class="nav-item"><Link class="nav-link" to="/user/branch/receive"><FcDownload className='nav-icon text-danger' />Received Product</Link></li>
                    </div>

                    {/* <li class="nav-item"><Link class="nav-link" to="/user/form">
                        <FcFile className='nav-icon' /> Customer Form</Link></li> */}

                    <li class="nav-title">Transaction</li>
                    <li class="nav-item"><Link class="nav-link" to="/user/transaction">
                        <FaDesktop className='nav-icon' /> Transaction Logs</Link></li>

                    <li class="nav-title">History</li>

                    <li class="nav-item"><Link class="nav-link" to="/user/logs">
                        <FaDesktop className='nav-icon' /> Activity Logs</Link></li>

                    <li class="nav-item mt-auto" onClick={Logout}><a style={{cursor: 'pointer'}} class="nav-link nav-link-danger fw-bold text-danger" target="_top">
                        <BiLogOut className="nav-icon" /> Logout
                    </a></li>
                </ul>
                <button class="sidebar-toggler" type="button" data-coreui-toggle="unfoldable"></button>
            </div>






            <div className=" wrapper d-flex flex-column min-vh-100">
                <div className="mt-5">
                    <Switch>
                        {
                            UserRoutes.map((routes, id) => {
                                return (
                                    routes.component && (
                                        <Route
                                            key={id}
                                            path={routes.path}
                                            exact={routes.exact}
                                            name={routes.name}
                                            render={(props) => <routes.component {...props} />}
                                        />
                                    )
                                )
                            })
                        }
                        <Redirect from='/user' to="/user/dashboard" />
                    </Switch>
                </div>
            </div>
        </>
    )
}

export default User