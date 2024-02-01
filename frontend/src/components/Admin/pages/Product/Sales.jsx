import axios from 'axios'
import { PrimeIcons } from 'primereact/api'
import { Button } from 'primereact/button'
import { Card } from 'primereact/card'
import { Column } from 'primereact/column'
import { DataTable } from 'primereact/datatable'
import React, { useEffect, useState } from 'react'
import { Link } from 'react-router-dom/cjs/react-router-dom'
import swal from 'sweetalert'

function Sales() {

    const [Store, setStore] = useState([]);
    const [loading, setloading] = useState(true)
    useEffect(() => {
        axios.get(`/api/GetStore`).then(res => {
            if (res.data.status === 200) {
                setStore(res.data.data);
            }
            setloading(false)
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
        
    },[])

    const StoreName = (Store) => {
        return (
            <>
                <span>{Store.last_name} {Store.first_name} {Store.midle_name}</span>
            </>
        )
    }

    const ActionButton = (Store) => {
        return (
            <>
               <Link to={`/admin/sales/branch=${Store.id}`}> <Button className='p-button-sm p-button' label='Sales' raised icon={PrimeIcons.CHART_LINE} /></Link>
            </>
        )
    }

    return (
        <div className='mt-3'>
            <Card title="Product Sales Monitor">
                <DataTable value={Store} paginator loading={loading} paginatorLeft rows={10}>
                    <Column field='store_name' header="Store Name"></Column>
                    <Column field='first_name' body={StoreName} header="Store Manager"></Column>
                    <Column field='city' header="City"></Column>
                    <Column field='id' body={ActionButton} header="Action"></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Sales