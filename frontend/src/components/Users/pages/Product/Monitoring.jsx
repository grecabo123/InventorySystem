import axios from 'axios';
import { Badge } from 'primereact/badge';
import { Card } from 'primereact/card'
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable'
import React, { useEffect, useState } from 'react'
import swal from 'sweetalert';

function Monitoring() {

    const [loading, setLoading] = useState(true);
    const [Products, setProduct] = useState([]);

    useEffect(() => {
        axios.get(`/api/MonitorStocks/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {
                setProduct(res.data.data)
            }
            setLoading(false)
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    },[]);

    const StatusCheck = (Products) => {
        return (
            <>
                {
                    Products.pcs <= 0 ? <Badge severity={'danger'} value={'Out of Stock'} /> : <Badge severity={'success'} value={'Stock'} />
                }
            </>
        )
    }

    return (
        <div className='mt-3'>
            <Card title="Monitor Product Stocks">
                <DataTable value={Products} paginator paginatorLeft rows={9} loading={loading}>
                    <Column field='product' header="Product Name"></Column>
                    <Column field='brand' header="Product Brand"></Column>
                    <Column field='model' header="Product Model"></Column>
                    <Column field='serial_num' header="Serial Number"></Column>
                    <Column field='pcs' header="Quantity"></Column>
                    <Column field='status' body={StatusCheck} header="Status"></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Monitoring