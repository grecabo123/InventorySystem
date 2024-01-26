import axios from 'axios'
import { Button } from 'primereact/button'
import { Column } from 'primereact/column'
import { DataTable } from 'primereact/datatable'
import { Dialog } from 'primereact/dialog'
import { InputNumber } from 'primereact/inputnumber'
import { InputTextarea } from 'primereact/inputtextarea'
import { Panel } from 'primereact/panel'
import { Toast } from 'primereact/toast'
import React, { useEffect, useRef, useState } from 'react'
import { Link } from 'react-router-dom/cjs/react-router-dom'
import swal from 'sweetalert'

function Details(props) {

    const [Product, setProduct] = useState([]);
    const [visible, setVisible] = useState(false);
    const [loading, setloading] = useState(false);
    const [btndis, setBtn] = useState(false);
    const [inputpcs, setpcs] = useState()
    const toast = useRef();
    const [text, setText] = useState()
    const [DetailsProduct, setProductDetails] = useState({
        id: "",
        product_name: "",
        product_model: "",
        product_brand: "",
        quantity: "",
    });
    const [Errormsg, setError] = useState({
        error: "",
    })
    useEffect(() => {
        ProductList();
    }, []);

    const ProductList = () => {
        axios.get(`/api/ProductDisplay`).then(res => {
            if (res.data.status === 200) {
                setProduct(res.data.data);
            }
            setloading(false)
        }).catch((error) => {
            if (error.response.status === 500) {

            }
        })

    }

    const BackPage = () => {
        localStorage.removeItem('store_name');
        localStorage.removeItem('store_id')
    }
    const template = <>
        <div className="d-flex justify-content-between align-items-center p-3">
            <span className='fs-5 text-light'>{localStorage.getItem('store_name')}</span>
            <Link to={`/admin/distribute`}> <Button className='p-button-sm p-button-success' label='Return Page' onClick={BackPage} /></Link>
        </div>
    </>

    const ActionButton = (Product) => {
        return (
            <>
                <Button className='p-button-sm p-button-info'
                    label='Distribute'
                    data-id={Product.id}
                    data-product_name={Product.product}
                    data-brand={Product.brand}
                    data-model={Product.model}
                    data-pcs={Product.quantity}
                    onClick={GetTransfer} />
            </>
        )
    }
    const GetTransfer = (e) => {
        setVisible(true)
        setProductDetails({
            id: e.currentTarget.getAttribute('data-id'),
            product_name: e.currentTarget.getAttribute('data-product_name'),
            brand: e.currentTarget.getAttribute('data-brand'),
            model: e.currentTarget.getAttribute('data-model'),
            quantity: e.currentTarget.getAttribute('data-pcs'),
        });
    }

    const hideModal = () => {
        setVisible(false)
    }
    const inputnumbervalue = (e) => {
        if (e.value <= DetailsProduct.quantity) {
            setBtn(false)
            setpcs(e.value)
            setError({
                error: "",
            });
        }
        else {
            setBtn(true)
            setError({
                error: "The Quantity you've inputted is exceed"
            });
        }
    }

    const ProductDistribute = (e) => {
        e.preventDefault();
        if (inputpcs > 0) {
            const data = {
                pcs: inputpcs,
                store_name: localStorage.getItem('store_name'),
                product_id: DetailsProduct.id,
                user_fk: localStorage.getItem('auth_id'),
                store_id: localStorage.getItem('store_id'),
                description: text,
            };
            axios.post(`/api/DistributeProduct`, data).then(res => {
                if (res.data.status === 200) {
                    toast.current.show({
                        severity: "success",
                        summary: "Distribute Product",
                        detail: "Successfully",
                    });
                    ProductList();
                    document.getElementById('form_reset').reset();
                    setVisible(false);
                }
            }).catch((error) => {
                if (error.response.status === 500) {
                    swal("Warning", error.response.statusText, 'warning');
                }
            })
        }
        else{
            alert("123")
        }
    }


    return (
        <div className='mt-3'>
            <Toast ref={toast} />
            <Panel headerTemplate={template}>
                <DataTable value={Product} loading={loading} header='List of Products' paginator paginatorLeft rows={8}>
                    <Column field='product' header="Name of Product"></Column>
                    <Column field='model' header="Model"></Column>
                    <Column field='brand' header="Brand"></Column>
                    <Column field='quantity' header="Quantity"></Column>
                    <Column field='id' body={ActionButton} header="Actions"></Column>
                </DataTable>
            </Panel>

            <Dialog header={DetailsProduct.product_name} onHide={hideModal} visible={visible} position='top' draggable={false} style={{ width: '50vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }}>
                <form onSubmit={ProductDistribute} id='form_reset'>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 mb-3">
                                <label htmlFor="" className="form-label">
                                    Quantity
                                </label>
                                <InputNumber required className='w-100' onChange={inputnumbervalue} name='quantity' />
                                <span className='text-danger'>{Errormsg.error}</span>
                            </div>
                            <div className="col-lg-12 mb-3">
                                <label htmlFor="" className="form-label">
                                    Description
                                </label>
                                <InputTextarea className='w-100' rows={5} cols={5} value={text} onChange={(e) => setText(e.target.value)} name='desc' />
                                {/* <span className='text-danger'>{Errormsg.error}</span> */}
                            </div>
                            <div className="mt-3 d-flex justify-content-end">
                                <Button className=' p-button-sm p-button-success' disabled={btndis} label='Distribute Product' />
                            </div>
                        </div>
                    </div>
                </form>
            </Dialog>
        </div>
    )
}

export default Details