import axios from 'axios'
import { Button } from 'primereact/button'
import { Card } from 'primereact/card'
import { Column } from 'primereact/column'
import { DataTable } from 'primereact/datatable'
import { Dialog } from 'primereact/dialog'
import React, { useEffect, useState } from 'react'
import { Link } from 'react-router-dom/cjs/react-router-dom'

function Distribute() {

    const [StoreData, setStore] = useState([]);
    const [loading, setloading] = useState([]);
    const [visible, setVisible] = useState(false);
    const [DataDis, setData] = useState({
        id: "" 
    });

    useEffect(() => {
        getStore();
    },[]);

    const getStore = () => {
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
    }

    const ActionButton = (StoreData) => {
        return (
            <>
               <Link to={`/admin/distribute/refid=${StoreData.id}`}> <Button className='p-button-sm p-button-info' 
               data-id={StoreData.id} onClick={GetName} data-name={StoreData.store_name} label='Distribute Product' /></Link>
            </>
        )
    }
    const GetName = (e) => {
        localStorage.setItem('store_name',e.currentTarget.getAttribute('data-name'))
        localStorage.setItem('store_id',e.currentTarget.getAttribute('data-id'))
    }
    const StoreName = (StoreData) => {
        return (
            <>
                <span>{StoreData.last_name} {StoreData.first_name} {StoreData.midle_name}</span>
            </>
        )
    }


    return (
        <div className='mt-3'>
            <Card title="Distribute Product">
                <DataTable value={StoreData} loading={loading} paginator paginatorLeft rows={8}>
                    <Column field='store_name' header="Store Name"></Column>
                    <Column field='first_name' body={StoreName} header="Store Manager"></Column>
                    <Column field='id' body={ActionButton} header="Actions"></Column>
                </DataTable>
            </Card>

           
        </div>
    )
}

export default Distribute