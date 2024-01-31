import axios from 'axios';
import { Card } from 'primereact/card'
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable'
import React, { useEffect, useState } from 'react'
import swal from 'sweetalert';

function Transaction() {

    const [Logs, setLogs]  = useState([])
    const [loading, setLoading] = useState(true)
    useEffect(() => {
        axios.get(`/api/TransactionLogs/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {
                setLogs(res.data.data);
            }
            setLoading(false)
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning')
            }
        })
    },[]);

    const PriceFormat = (Logs) => {
        return (
            <>
                <span>₱{Logs.price_product.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</span>
            </>
        )
    }

    const TotalPriceformat = (Logs) => {
        return (
            <>
                <span>₱{Logs.total_price.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</span>
            </>
        )
    }

    return (
        <div className='mt-3'>
            <Card title="Transaction Logs">
                <DataTable value={Logs} loading={loading} paginator paginatorLeft rows={10} >
                    <Column field='invoice_id' header="Invoice #"></Column>
                    <Column field='product_name' header="Product Name"></Column>
                    <Column field='product_brand' header="Product Brand"></Column>
                    <Column field='product_model' header="Product Model"></Column>
                    <Column field='product_serial' header="Product Serial"></Column>
                    <Column field='price_product' body={PriceFormat} header="Product Price"></Column>
                    <Column field='quantity' header="Quantity"></Column>
                    <Column field='total_price' body={TotalPriceformat} header="Total Amount"></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Transaction