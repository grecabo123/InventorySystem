import { Card } from 'primereact/card'
import React, { useEffect } from 'react'
import { motion } from "framer-motion";
import { FaUser } from 'react-icons/fa';
import axios from 'axios';
import swal from 'sweetalert';
import { useState } from 'react';
import { Panel } from 'primereact/panel';
import { Skeleton } from 'primereact/skeleton';

function Dashboard() {

    const [DashboardData, setData] = useState({
        allproduct: "",
        earn: "",
        stock: "",
        out_of_stock: "",
    });
    const [loading, setLoading] = useState(true)

    useEffect(() => {
        axios.get(`/api/Dashboard/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {
                setData({
                    earn: res.data.amount,
                    allproduct: res.data.all,
                    stock: res.data.stock,
                    out_of_stock: res.data.out,
                })
            }
            setLoading(false)
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    },[]);

    return (
        <div className='mt-3'>
            <div className="container">
             
                {
                    loading ? <Skeleton />
                    :
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
                                    <span>{DashboardData.allproduct}</span>
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
                                <span>₱{DashboardData.earn == null ? "0.00" :  DashboardData.earn.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</span>
                                {/* <span>₱{DashboardData.earn == null ? "0.00" : DashboardData.earn.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</span> */}
                                    {/* <span>₱{DashboardData.earn == null ? 0.00 : DashboardData.earn.toFixed(2)}</span> */}
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
                                    <span>{DashboardData.stock}</span>
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
                                    <span>{DashboardData.out_of_stock}</span>
                                </div>
                            </Card>
                        </motion.div>
                    </div>
                    

                    <div className="mt-3">
                        <Panel>

                        </Panel>
                    </div>
                </div>
                }
            </div>
        </div>
    )
}

export default Dashboard