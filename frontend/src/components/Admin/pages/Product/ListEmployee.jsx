import axios from 'axios'
import { Badge } from 'primereact/badge'
import { Column } from 'primereact/column'
import { DataTable } from 'primereact/datatable'
import React, { useEffect } from 'react'
import { useState } from 'react'
import swal from 'sweetalert'

function ListEmployee(data) {

    const [loading, setLoading] = useState(true)
    const [ListEmplo, setEmplo] = useState([]);

    useEffect(() => {
        axios.get(`/api/ListofEmployee/${data.data}`).then(res => {
            if(res.data.status === 200) {
                setEmplo(res.data.data)
            }
            setLoading(false)
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning')
            }
        })
    },[])

    const RolePerson = (ListEmplo) => {
        return (
            <>
                {ListEmplo.role == 4 ? <Badge value={'Driver'} /> : <Badge value={'Employee'} />}
            </>
        )
    }

    return (
        <div>
            <DataTable value={ListEmplo} loading={loading} paginator rows={10} paginatorLeft header="List of Employee">
                <Column field='employee' header="Employee Name"></Column>
                <Column field='email' header="Email"></Column>
                <Column field='role' body={RolePerson} header="Role"></Column>
            </DataTable>
        </div>
    )
}

export default ListEmployee