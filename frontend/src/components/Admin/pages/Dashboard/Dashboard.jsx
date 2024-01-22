import { Card } from 'primereact/card'
import React from 'react'
import { FaUser } from 'react-icons/fa'
import { Chart } from 'primereact/chart';
import { motion } from "framer-motion";

function Dashboard() {

    const data = {
        labels: ['Shoes', 'Gloves', 'War'],
        datasets: [
            {
                label: 'Product Current Price',
                data: ['32', '93', '67'],
                backgroundColor: [
                    'rgba(255, 159, 64, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(54, 162, 235, 1)',
                ],
                borderWidth: 1
            }
        ]
    };
    const options = {
        indexAxis: 'x',
        maintainAspectRatio: false,
        aspectRatio: 0.8,
        scales: {
            x: {
                grid: {
                    display: false
                }
            },
            y: {
                beginAtZero: true,
                grid: {
                    display: false
                }
            }
        }
    };

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
                                delay: 0.2,
                                ease: [0, 0.71, 0.2, 1.01]
                            }}
                        >
                        <Card title="All Accounts">
                            <div className="d-flex justify-content-between">
                                <span><FaUser /></span>
                                <span><b>4</b></span>
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
                        <Card title="All Accounts">
                            <div className="d-flex justify-content-between">
                                <span><FaUser /></span>
                                <span><b>4</b></span>
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
                        <Card title="All Accounts">
                            <div className="d-flex justify-content-between">
                                <span><FaUser /></span>
                                <span><b>4</b></span>
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
                        <Card title="All Accounts">
                            <div className="d-flex justify-content-between">
                                <span><FaUser /></span>
                                <span><b>4</b></span>
                            </div>
                        </Card>
                        </motion.div>
                    </div>
                    <div className="mt-3">
                        <div className="row">
                            <div className="col-lg-6 mb-2">
                                <Chart type="bar" style={{ height: "320px" }} width='100%' data={data} options={options} />
                            </div>
                            <div className="col-lg-6 mb-2">
                                <Chart type="bar" style={{ height: "320px" }} width='100%' data={data} options={options} />
                            </div>
                            <div className="mt-3">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Dashboard