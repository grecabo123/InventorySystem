import axios from 'axios'
import moment from 'moment';
import { Card } from 'primereact/card';
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable';
import React, { useEffect, useState } from 'react'
import swal from 'sweetalert'

function Logs() {

    const [loading, setLoading] = useState(true);
    const [LogsData, setLogs] = useState([]);

    useEffect(() => {
        axios.get(`/api/Logs/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {
                setLogs(res.data.data);
            }
            setLoading(false)
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    },[])

    const DateFormat = (LogsData) => {
        return (
            <>
                <span>{moment(LogsData.created_at).format('MMM DD YYYY hh:mm a')}</span>
            </>
        )
    }

    return (
        <div className='mt-3'>
            <Card title="Activity Logs">
                <DataTable value={LogsData} loading={loading} paginator paginatorLeft rows={8}>
                    <Column field='desc' header="Description"></Column>
                    <Column field='created_at' body={DateFormat} header="DateTime"></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Logs