import React, { useEffect, useState } from 'react'
import { Chart } from 'primereact/chart';
import axios from 'axios';
import swal from 'sweetalert';

function MonitorSold(data_id) {

    var product_name = [];
    var amount = [];

    const [ListProduct, setProduct] = useState([])
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        // console.log(data_id);
        axios.get(`/api/ListofSoldItemGroup/${data_id.data_id}`).then(res => {
            if(res.data.status === 200) {
                setProduct(res.data.data);
            }
            setLoading(false);
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning')
            }
        })
    },[]);

    for (let index = 0; index < ListProduct.length; index++) {
        const name = ListProduct[index].product_name;
        const price = ListProduct[index].total_price;
        
        product_name.push(name)
        amount.push(price);
    }

    const data = {
        labels: product_name,
        datasets: [
            {
                label: 'Product Name & Total Amount',
                data: amount,
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
        <div>
            <Chart type="bar" style={{ height: "250px" }} width='100%'   data={data} options={options} />
            
        </div>
    )
}

export default MonitorSold