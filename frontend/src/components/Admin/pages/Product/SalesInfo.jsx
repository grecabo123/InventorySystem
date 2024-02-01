import axios from 'axios';
import { Panel } from 'primereact/panel'
import { Skeleton } from 'primereact/skeleton';
import React, { useEffect, useState } from 'react'
import swal from 'sweetalert';
import { motion } from "framer-motion";
import { Card } from 'primereact/card';
import { Button } from 'primereact/button';
import { Link } from 'react-router-dom/cjs/react-router-dom';
import { DataTable } from 'primereact/datatable';
import ListProduct from './ListProduct';
import ListEmployee from './ListEmployee';
import MonitorSold from './MonitorSold';

function SalesInfo(props) {

    const [DashboardData, setData] = useState({
        allproduct: "",
        earn: "",
        stock: "",
        out_of_stock: "",
        name: "",
    });
    const [loading, setLoading] = useState(true);

    useEffect(() => {

        const id = props.match.params.id;

        axios.get(`/api/SalesInformation/${id}`).then(res => {
            if (res.data.status === 200) {
                setData({
                    earn: res.data.amount,
                    allproduct: res.data.all,
                    stock: res.data.stock,
                    out_of_stock: res.data.out,
                    name: res.data.name,
                })
            }
            setLoading(false);
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning')
            }
        })
    }, [props.match.params.id]);

    return (
        <div className='mt-3'>
            {
                loading ?
                    <>
                        <Panel className='p-panel'>
                            <div className="container">
                                <div className="row">
                                    <div className="col-lg-12 mb-2">
                                        <Skeleton />
                                    </div>
                                </div>
                            </div>
                        </Panel>
                    </>

                    :

                    <>

                        {/* <Panel header={DashboardData.name} className='bg-transparent'> */}
                        <div className="container">
                            <div className="row">
                                <div className="d-flex justify-content-between mb-3">
                                    <h5 className='text-secondary'>Branch: <small>{DashboardData.name}</small></h5>
                                    <Link to={`/admin/sales`}><Button className='p-button-info p-button-sm' label='Return Page' /></Link>
                                </div>
                                <div className="col-lg-3 mb-2">
                                    <motion.div
                                        initial={{ opacity: 0, scale: 0.5 }}
                                        animate={{ opacity: 1, scale: 1 }}
                                        transition={{
                                            duration: 0.8,
                                            delay: 0.2,
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
                                            delay: 0.4,
                                            ease: [0, 0.71, 0.2, 1.01]
                                        }}
                                    >
                                        <Card subTitle="Total Earned">
                                            <div className="d-flex justify-content-between">
                                                <span>₱{DashboardData.earn == null ? "0.00" : DashboardData.earn.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</span>
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
                                            delay: 0.6,
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
                            </div>
                        </div>

                        <div className="mt-3">
                            <div className="container">
                                <motion.div
                                    initial={{ opacity: 0, scale: 0.5 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    transition={{
                                        duration: 0.8,
                                        delay: 1.0,
                                        ease: [0, 0.71, 0.2, 1.01]
                                    }}
                                >
                                    <ListProduct data={props.match.params.id} />
                                </motion.div>
                            </div>
                        </div>
                        <div className="mt-3">
                            <div className="container">
                                <div className="row">
                                    <div className="col-lg-6 mb-2">
                                        <motion.div
                                            initial={{ opacity: 0, scale: 0.5 }}
                                            animate={{ opacity: 1, scale: 1 }}
                                            transition={{
                                                duration: 0.8,
                                                delay: 1.2,
                                                ease: [0, 0.71, 0.2, 1.01]
                                            }}
                                        >
                                            <ListEmployee data={props.match.params.id} />
                                        </motion.div>
                                    </div>
                                    <div className="col-lg-6 mb-2">
                                        <motion.div
                                            initial={{ opacity: 0, scale: 0.5 }}
                                            animate={{ opacity: 1, scale: 1 }}
                                            transition={{
                                                duration: 0.8,
                                                delay: 1.4,
                                                ease: [0, 0.71, 0.2, 1.01]
                                            }}
                                        >
                                            <MonitorSold data_id={props.match.params.id} />
                                        </motion.div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {/* </Panel> */}
                    </>
            }
        </div>
    )
}

export default SalesInfo