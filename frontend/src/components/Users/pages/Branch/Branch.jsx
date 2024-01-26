import axios from 'axios'
import { Button } from 'primereact/button';
import { Card } from 'primereact/card'
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable'
import React, { useEffect, useState } from 'react'
import { Link } from 'react-router-dom/cjs/react-router-dom';

function Branch() {

    const [Store, setStore] = useState([]);
    const [loading, setloading] = useState(true)

    useEffect(() => {
        getStore();
    },[])

    const getStore = () => {
        axios.get(`/api/GetStoreList/${localStorage.getItem('auth_id')}`).then(res => {
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

    const Manager = (Store) => {
        return (
            <>
                <span>{Store.last_name} {Store.first_name} {Store.middle_name}</span>
            </>
        )
    }
    const ButtonPage = (Store) => {
        return (
            <>
                <Link to={`/user/branch/transfer/refid=${Store.id}`}><Button 
                className='p-button-sm p-button-info' 
                label='Transfer Item'
                data-store_id={Store.id}
                data-store_name={Store.store_name}
                onClick={GetSave}
                /></Link>
            </>
        )
    }

    const GetSave = (e) => {
        localStorage.setItem('store_id',e.currentTarget.getAttribute('data-store_id'))
        localStorage.setItem('store_name',e.currentTarget.getAttribute('data-store_name'))
    };

    return (
        <div className='mt-3'>
            <Card title="Transfer Branch to Branch">
                <DataTable value={Store} paginator paginatorLeft rows={9}>
                    <Column field='store_name' header="Store Name"></Column>
                    <Column field='first_name' body={Manager} header="Store Manager"></Column>
                    <Column field='city' header="Store City"></Column>
                    <Column field='id' body={ButtonPage} header="Action"></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Branch