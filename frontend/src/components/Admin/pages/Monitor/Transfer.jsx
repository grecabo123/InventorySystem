import axios from 'axios';
import moment from 'moment';
import { Badge } from 'primereact/badge';
import { Card } from 'primereact/card'
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable'
import React, { useEffect, useState } from 'react'
import swal from 'sweetalert';

function Transfer() {

    const [loading, setloading] = useState(true);
    const [Monitor, setMonitor] = useState([]);

    useEffect(() => {
        axios.get(`/api/TranferMonitor`).then(res => {
            if(res.data.status === 200) {
                setMonitor(res.data.data);
            }
            setloading(false);
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    },[]);

    const Created = (Monitor) => {
        return (
            <>
                <span>{moment(Monitor.created_at).format('MMM DD YYYY')}</span>
            </>
        )
    }

    const TypeRequest = (Monitor) => {
        return (
            <>
                {
                    Monitor.type_of_request === 2 ? <Badge severity={'warning'} value='Distribute' /> : <Badge severity={'success'} value={'Request'} />
                }
            </>
        )
    }

    const StatusProduct = (Monitor) => {
        return (
            <>
                {
                    Monitor.status === 2 ? <Badge severity={'info'} value={'On Deliver'} /> : <Badge severity={'success'} value={'Received'} />
                }
            </>
        )
    }

    return (
        <div>
            <Card title="Transfer Product Monitor">
                <DataTable value={Monitor} paginator paginatorLeft rows={8} loading={loading}>
                    <Column field='store_name' header="Store Name"></Column>
                    <Column field='employee' header="Name of Driver"></Column>
                    <Column field='type_of_request' body={TypeRequest} header="Type of Request"></Column>
                    <Column field='product' header="Product Name"></Column>
                    <Column field='quantity' header="Quantity"></Column>
                    <Column field='status' body={StatusProduct} header="Status"></Column>
                    <Column field='created_at' body={Created} header="DateTime"></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Transfer