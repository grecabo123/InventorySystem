import { Card } from 'primereact/card'
import React, { useEffect } from 'react'
import { motion } from "framer-motion";
import { FaUser } from 'react-icons/fa';
import axios from 'axios';
import swal from 'sweetalert';
import { useState } from 'react';

function Dashboard() {

    const [DashboardData, setData] = useState({
        allproduct: "",
        earn: "",
        stock: "",
        out_of_stock: "",
    });

    useEffect(() => {
        axios.get(`/api/Dashboard/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {

            }
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    },[]);

    return (
        <div className='mt-3'>
            <div className="container">
                <div className="row">
                    <div className="col-lg-3 mb-2">
                        <motion.div
                            initial={{ opacity: 0, scale: 0.5 }}
                            animate={{ opacity: 1, scale: 1 }}
                            transition={{
                                duration: 0.8,
                                delay: 0.8,
                                ease: [0, 0.71, 0.2, 1.01]
                            }}
                        >
                            <Card subTitle="All Products">
                                <div className="d-flex justify-content-between">
                                    <span><FaUser /></span>
                                </div>
                            </Card>
                        </motion.div>
                    </div>
                    <div className="col-lg-3 mb-2">
                        <motion.div
                            initial={{ opacity: 0, scale: 0.5 }}
                            animate={{ opacity: 1, scale: 1 }}
                            transition={{
                                duration: 0.8,
                                delay: 0.8,
                                ease: [0, 0.71, 0.2, 1.01]
                            }}
                        >
                            <Card subTitle="Total Earned">
                                <div className="d-flex justify-content-between">
                                    <span><FaUser /></span>
                                </div>
                            </Card>
                        </motion.div>
                    </div>
                    <div className="col-lg-3 mb-2">
                        <motion.div
                            initial={{ opacity: 0, scale: 0.5 }}
                            animate={{ opacity: 1, scale: 1 }}
                            transition={{
                                duration: 0.8,
                                delay: 0.8,
                                ease: [0, 0.71, 0.2, 1.01]
                            }}
                        >
                            <Card subTitle="Stock">
                                <div className="d-flex justify-content-between">
                                    <span><FaUser /></span>
                                </div>
                            </Card>
                        </motion.div>
                    </div>
                    <div className="col-lg-3 mb-2">
                        <motion.div
                            initial={{ opacity: 0, scale: 0.5 }}
                            animate={{ opacity: 1, scale: 1 }}
                            transition={{
                                duration: 0.8,
                                delay: 0.8,
                                ease: [0, 0.71, 0.2, 1.01]
                            }}
                        >
                            <Card subTitle="Out of Stock">
                                <div className="d-flex justify-content-between">
                                    <span><FaUser /></span>
                                </div>
                            </Card>
                        </motion.div>
                    </div>
                    
                </div>
            </div>
        </div>
    )
}

export default Dashboard