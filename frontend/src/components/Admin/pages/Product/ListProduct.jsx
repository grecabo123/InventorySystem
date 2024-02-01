import axios from 'axios';
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable'
import React, { useEffect } from 'react'
import { useState } from 'react';

function ListProduct(data) {

    const [ListSold, setSold] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        axios.get(`/api/ListofSoldItem/${data.data}`).then(res => {
            if(res.data.status === 200) {
                setSold(res.data.data);
            }
            setLoading(false)
        }).catch((error) => {
            if(error.response.status === 500) {

            }
        })
    },[]);

    const PriceFormat = (ListSold) => {
        return (
            <>
                <span>₱{ListSold.total_price.toFixed(2)}</span>
            </>
        )
    }

    return (
        <div>
            <DataTable resizableColumns={true} header="Product Sold" loading={loading} paginator paginatorLeft rows={10} value={ListSold}>
                <Column field='customer_name' header="Customer Name"></Column>
                <Column field='invoice_id' header="Invoice #"></Column>
                <Column field='product_name' header="Product Name"></Column>
                <Column field='product_serial' header="Product Serial"></Column>
                <Column field='quantity' header="Quantity"></Column>
                <Column field='total_price' body={PriceFormat} header="Total Price"></Column>                
            </DataTable>
        </div>
    )
}

export default ListProduct