import axios from 'axios'
import { Badge } from 'primereact/badge'
import { Button } from 'primereact/button'
import { Column } from 'primereact/column'
import { DataTable } from 'primereact/datatable'
import { Dialog } from 'primereact/dialog'
import { InputNumber } from 'primereact/inputnumber'
import { InputText } from 'primereact/inputtext'
import { Panel } from 'primereact/panel'
import { Toast } from 'primereact/toast'
import React, { useEffect, useRef, useState } from 'react'
import { Link } from 'react-router-dom/cjs/react-router-dom'
import swal from 'sweetalert'

function TransferProduct() {

    const [Product, setProduct] = useState([]);
    const [Details, setDetails] = useState({
        product_id: "",
        product_name: "",
        pcs: "",
        travel_id: "",
    });
    const [Error, setError] = useState({
        error: "",
    });
    const [quan, setQuan] = useState({
        pcs: "",
    })
    const toast = useRef();
    const [btndis, setBtn] = useState(false);
    const [visible, setVisible] = useState(false)
    useEffect(() => {
        ListProduct();
    },[]);

    const Return = () => {
        localStorage.removeItem('store_name')
        localStorage.removeItem('store_id')
    }

    const header = <>
        <div className="d-flex justify-content-between align-items-center p-3">
            <span className='text-light'>{localStorage.getItem('store_name')}</span>
            <Link to={`/user/branch`}><Button className='p-button-sm p-button-info'
                onClick={Return}
                label='Return Page' /></Link>
        </div>
    </>

    const ListProduct = () => {
        axios.get(`/api/ProductStoreData/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {
                setProduct(res.data.data)
            }
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    }

    const ProductStatus = (Product) => {
        return (
            <>
                {
                    Product.pcs < 0 ? <Badge severity={'danger'} value={'Out of Stock'} /> : <Badge severity={'success'} value={'Stock'} />
                }
            </>
        )
    }
    const ProductAction = (Product) => {
        return (
            <>
                <Button 
                    className='p-button-sm p-button-warning' 
                    label='Transfer Product' 
                    onClick={TransferModal}
                    data-travel_id={Product.id}
                    data-product_id={Product.product_fk}
                    data-product_name={Product.product}
                    data-pcs={Product.pcs}
                />
            </>
        )
    }

    const HideModal = () => {
        setVisible(false);
    }

    const TransferModal = (e) => {
        setVisible(true);
        setDetails({
            product_id: e.currentTarget.getAttribute('data-product_id'),
            product_name: e.currentTarget.getAttribute('data-product_name'),
            pcs: e.currentTarget.getAttribute('data-pcs'),
            travel_id: e.currentTarget.getAttribute('data-travel_id'),
        });
    }
    const handleinput = (e) => {
        setQuan(e.value)
        if(e.value >= Details.pcs){
            setError({
                error: "Exceed Pcs"
            });
            setBtn(true)
        }
        else{
            setError({
                error: "",
            })
            setBtn(false)
        }
    }


    const TransferBranch = (e) => {
        e.preventDefault();

        const data = {
            product_id: Details.product_id,
            user_fk: localStorage.getItem('auth_id'),
            to_branch: localStorage.getItem('store_id'),
            pcs: quan,  
        };

        axios.put(`/api/TransferBranch`,data).then(res => {
            if(res.data.status === 200) {
                setVisible(false);
                document.getElementById('transfer').reset();
                ListProduct();
                toast.current.show({
                    severity: "success",
                    summary: "Transfer Product To"+' '+localStorage.getItem('store_name'),
                    detail: "Successfully",
                })
            }
        }).catch((error) => {
            if(error.response.status === 500){
                swal("Warning",error.response.statusText,'warning');
            }
        })
    }

    return (
        <div className='mt-3'>
            <Toast ref={toast} />
            <Panel headerTemplate={header}>
                <DataTable value={Product} paginator paginatorLeft rows={8} >
                    <Column field='product' header="Product Name"></Column>
                    <Column field='brand' header="Brand"></Column>
                    <Column field='model' header="Model"></Column>
                    <Column field='pcs' header="Quantity"></Column>
                    <Column field='status' body={ProductStatus} header="Product Status"></Column>
                    <Column field='id' body={ProductAction} header="Actions"></Column>
                </DataTable>
            </Panel>
            <Dialog header={localStorage.getItem('store_name')} visible={visible} position='top' onHide={HideModal} draggable={false}breakpoints={{'960px': '75vw', '640px': '100vw'}} style={{width: '50vw'}}>
                <form onSubmit={TransferBranch} id='transfer'>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Product Name
                                </label>
                                <InputText className='w-100' value={Details.product_name} readOnly />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Quantity
                                </label>
                                <InputNumber className='w-100' required onChange={handleinput}  />
                                <span className='text-danger'>{Error.error}</span>
                            </div>
                            <div className="mt-3 d-flex justify-content-end">
                                <Button disabled={btndis} className='p-button-sm p-button-info' label='Transfer' />
                            </div>
                        </div>
                    </div>
                </form>
            </Dialog>
        </div>
    )
}

export default TransferProduct