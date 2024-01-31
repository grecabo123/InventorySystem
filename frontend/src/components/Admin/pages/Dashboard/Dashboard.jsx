import { Card } from 'primereact/card'
import React, { useEffect, useState } from 'react'
import { Chart } from 'primereact/chart';
import { motion } from "framer-motion";
import axios from 'axios';
import swal from 'sweetalert';
import { Skeleton } from 'primereact/skeleton';

function Dashboard() {

    const [AllDataCounts, setCounts] = useState({
        account: "",
        all_product: "",
        stock: "",
        out: "",
        total_income: "",
        sold: "",
        stores: "",
    });
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        axios.get(`/api/AllData`).then(res => {
            if (res.data.status === 200) {
                setCounts({
                    account: res.data.accounts,
                    all_product: res.data.product,
                    stock: res.data.stocks,
                    out: res.data.out,
                    total_income: res.data.total_income,
                    sold: res.data.sold,
                    stores: res.data.stores,
                });
            }
            setLoading(false)
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }, []);

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
                {
                    loading ? <Skeleton className='' width='100' borderRadius='10px' />
                        :
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
                                    <Card subTitle="All Accounts">
                                        <div className="d-flex justify-content-between">
                                            <span></span>
                                            <span>{AllDataCounts.account}</span>
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
                                    <Card subTitle="All Products">
                                        <div className="d-flex justify-content-between">
                                            <span></span>
                                            <span><b>{AllDataCounts.all_product}</b></span>
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
                                    <Card subTitle="Stock Products">
                                        <div className="d-flex justify-content-between">
                                            <span></span>
                                            <span><b>{AllDataCounts.stock}</b></span>
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
                                    <Card subTitle="Out of Stocks">
                                        <div className="d-flex justify-content-between">
                                            <span></span>
                                            <span><b>{AllDataCounts.out}</b></span>
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
                                    <Card subTitle="Overall Income">
                                        <div className="d-flex justify-content-between">
                                            <span></span>
                                            <span>₱{AllDataCounts.total_income == null ? "0.00" :  AllDataCounts.total_income.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</span>
                                            {/* <span>₱{AllDataCounts.total_income.toFixed(2)}</span> */}
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
                                    <Card subTitle="Product Sold">
                                        <div className="d-flex justify-content-between">
                                            <span></span>
                                            <span><b>{AllDataCounts.sold == null ? 0 : AllDataCounts.sold}</b></span>
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
                                    <Card subTitle="Product Damage">
                                        <div className="d-flex justify-content-between">
                                            <span></span>
                                            <span><b>{AllDataCounts.stock}</b></span>
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
                                    <Card subTitle="Total Branch">
                                        <div className="d-flex justify-content-between">
                                            <span></span>
                                            <span><b>{AllDataCounts.stores}</b></span>
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
                }
            </div>
        </div>
    )
}

export default Dashboard