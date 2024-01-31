import axios from 'axios';
import moment from 'moment';
import { Button } from 'primereact/button';
import { Card } from 'primereact/card'
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable'
import { Dialog } from 'primereact/dialog';
import { Dropdown } from 'primereact/dropdown';
import { InputTextarea } from 'primereact/inputtextarea';
import { Toast } from 'primereact/toast';
import React, { useEffect, useRef, useState } from 'react'
import swal from 'sweetalert';

function Received() {

    const [Data, setData] = useState([]);
    const [loading, setLoading] = useState(true);
    const [visible, setVisible] = useState(false);
    const [statuspick, setStatus] = useState([])
    const [desc, setDesc] = useState();
    const toast = useRef();
    const [Details, setDetails] = useState({
        travel: "",
        product: "",
        store: "",
        pcs: "",
        user_fk: "",
        product_name: "",
    })

    useEffect(() => {
        ListProduct();
    },[]);

    const ListProduct = () => {
        axios.get(`/api/ProductReceived/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {
                setData(res.data.data);
            }
            setLoading(false);
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    }

    const ActionButton = (Data) => {
        return (
            <>
                <Button className='p-button-sm p-button-success' label='Update'
                data-branch_id={Data.branch_id}
                data-product={Data.product_fk}
                data-store={Data.store_fk}
                data-pcs={Data.quantity}
                // data-user_fk={Data.user_fk}
                data-name={Data.product}
                onClick={GetUpdate}
                />
            </>
        )
    }

    

    const GetUpdate = (e) => {
        setVisible(true);
        setDetails({
            travel: e.currentTarget.getAttribute('data-branch_id'),
            product: e.currentTarget.getAttribute('data-product'),
            store: e.currentTarget.getAttribute('data-store'),
            pcs: e.currentTarget.getAttribute('data-pcs'),
            user_fk: e.currentTarget.getAttribute('data-user_fk'),
            product_name: e.currentTarget.getAttribute('data-name'),
        });
    }

    const HideModal = () => {
        setVisible(false);
    }

    const DateFormat = (Data) => {
        return (
            <>
                <span>{moment(Data.created_at).format('MMM DD YYYY')}</span>
            </>
        )
    }

    const StatusList = [
        {label: "OK", value: 1},
        {label: "Damage", value: 2},
        {label: "Lacking", value: 3},
        {label: "Wrong Product", value: 4},
    ]

    const TransferForm = (e) => {
        e.preventDefault();

        const data = {
            branch_id: Details.travel,
            product: Details.product,
            store_fk: Details.store,
            pcs: Details.pcs,
            desc: desc,
            status: statuspick,
        }
        // console.log(data);
        axios.put(`/api/ReceiveApproved`,data).then(res => {
            if(res.data.status === 200) {
                toast.current.show({
                    severity: "success",
                    summary: data.status === 1 ? "Received Product" : "Report Submitted",
                    detail: "Successfully",
                });
                setVisible(false)
                ListProduct();
                document.getElementById('reset_form').reset();
            }
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.status === 500) 
            }
        })
    }


    return (
        <div>
            <Card title="Receive Branch To Branch">
                <Toast ref={toast} />
                <DataTable value={Data} paginator paginatorLeft rows={9} loading={loading}>
                    <Column field='store_name' header='From Branch'></Column>
                    <Column field='product' header='Product Name'></Column>
                    <Column field='model' header='Product Model'></Column>
                    <Column field='serial_num' header='Serial Num'></Column>
                    <Column field='quantity' header='Quantity'></Column>
                    <Column field='id' body={ActionButton} header='Action'></Column>
                    <Column field='created_at' body={DateFormat} header='Date Delivered'></Column>
                </DataTable>
                <div className="container">
                    <div className="mt-5">
                        <small></small>
                    </div>
                </div>
            </Card>
            <Dialog header={Details.product_name} visible={visible} position='top' draggable={false} breakpoints={{'960px': '75vw', '640px': '100vw'}} style={{width: '50vw'}} onHide={HideModal}>
                <form onSubmit={TransferForm} id='reset_form'>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Status
                                </label>
                                <Dropdown className='w-100 p-inputtext-sm' options={StatusList} value={statuspick} onChange={(e) => setStatus(e.value)} placeholder='Status' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Description
                                </label>
                                <InputTextarea onChange={(e) => setDesc(e.target.value)} value={desc} style={{resize: "none"}} className='w-100' cols={5} placeholder='Write Something...' rows={5} />
                            </div>
                            <div className="mt-2 d-flex justify-content-end">
                                <Button className='p-button-info p-button-sm' label='Submit' />
                            </div>
                        </div>
                    </div>
                </form>
            </Dialog>
        </div>
    )
}

export default Received