import axios from 'axios';
import { PrimeIcons } from 'primereact/api';
import { Badge } from 'primereact/badge';
import { Button } from 'primereact/button';
import { Card } from 'primereact/card'
import { Column } from 'primereact/column'
import { DataTable } from 'primereact/datatable'
import { Dialog } from 'primereact/dialog';
import { Image } from 'primereact/image';
import { InputText } from 'primereact/inputtext';
import { InputTextarea } from 'primereact/inputtextarea';
import { Toast } from 'primereact/toast';
import React, { useEffect, useRef, useState } from 'react'

function Product() {

    const [visible, setVisible] = useState(false)
    const [create, setCreate] = useState({
        product: "",
        brand: "",
        model: "",
        desc: "",
        serial: "",
        pcs: "",
        price: "",
        error: [],
    });
    const [EditData, setEdit] = useState({
        product: "",
        brand: "",
        model: "",
        serial_num: "",
        quantity: "",
        price: "",
        id: "",
    });
    const toast = useRef();
    const [loading, setloading] = useState(true);
    const [ProductStored, setProduct] = useState([])
    const [FileUpload, setFile] = useState([])
    const [updatemodal, setUpdate] = useState(false);
    useEffect(() => {
        ProductList();
    },[]);

    const ProductList = () => {
        axios.get(`/api/ProductDisplay`).then(res => {
            if(res.data.status === 200) {
                setProduct(res.data.data);
            }
            setloading(false)
        }).catch((error) => {
            if(error.response.status === 500) {

            }
        })
    }

    const updatechange = (e) => {
        e.persist();
        setEdit({...EditData, [e.target.name] : e.target.value});
    }

    const AddProductModal = () => {
        setVisible(true)
    }
    const handleinput = (e) => {
        e.persist();
        setCreate({...create,[e.target.name] : e.target.value});
    }

    const handlefile = (e) => {
        e.persist();
        setFile({file: e.target.files[0]});
    }

    const CreateProduct = (e) => {
        e.preventDefault();

        const data = new FormData;

        data.append('product',create.product);
        data.append('brand',create.brand);
        data.append('model',create.model);
        data.append('desc',create.desc);
        data.append('serial',create.serial);
        data.append('pcs',create.pcs);
        data.append('price',create.price);
        data.append('files',FileUpload.file);

        axios.post(`/api/AddProduct`,data).then(res => {
            if(res.data.status === 200) {
                toast.current.show({severity: "success", summary: "Added Proudct", detail: "Successfully"});
                setVisible(false)
                ProductList();
                document.getElementById('form_add').reset();
                setFile([]);

            }
            else{
                setCreate({...create, error: res.data.error});
            }
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    }

    const hidemodal = () => {
        setVisible(false)
        setUpdate(false)
    }

    const StatusProduct = (ProductStored) => {
        return (
            <>
                {
                    ProductStored.quantity > 0 ? <Badge severity={'success'} value={'Stock'} /> : <Badge severity={'danger'} value={'Out of Stock'} />
                }
            </>
        )
    }
    const PriceFormat = (ProductStored) => {
        return (
            <>
            <span>₱{ProductStored.price.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</span>
                {/* <Image src={`http://127.0.0.1:8000/${ProductStored.image}`} width='90' preview /> */}
            </>
        )
    }

    const ActionBtn = (ProductStored) => {
        return (
            <>
                <Button 
                className='m-2 p-button-sm p-button-success' 
                label='Edit' 
                data-id={ProductStored.id}
                data-product={ProductStored.product}
                data-brand={ProductStored.brand}
                data-model={ProductStored.model}
                data-quantity={ProductStored.quantity}
                data-price={ProductStored.price}
                data-serial_num={ProductStored.serial_num}
                onClick={GetData} />
            </>
        )
    }

    const GetData = (e) => {
        setEdit({
            product: e.currentTarget.getAttribute('data-product'),
            brand: e.currentTarget.getAttribute('data-brand'),
            model: e.currentTarget.getAttribute('data-model'),
            quantity: e.currentTarget.getAttribute('data-quantity'),
            price: e.currentTarget.getAttribute('data-price'),
            serial_num: e.currentTarget.getAttribute('data-serial_num'),
            id: e.currentTarget.getAttribute('data-id'),
        });

        setUpdate(true);
    }

    const UpdateData = (e) => {
        e.preventDefault();

        const data = EditData;

        axios.put(`/api/UpdateData`,data).then(res => {
            if(res.data.status === 200) {
                toast.current.show({severity: "success", summary: "Updated Data", detail: "Successfully"});
                document.getElementById('update_form').reset();
                setUpdate(false)
                ProductList();
            }
        }).catch((error) => {
            if(error.response.status === 500) {

            }
        })
    }

    return (
        <div className='mt-3'>
            <Toast ref={toast} />
            <Card title="Product Data">
                <div className="d-flex justify-content-end">
                    <Button onClick={AddProductModal} className='p-button-info p-button-sm' label='Add Product' icon={PrimeIcons.PLUS} />
                </div>
                <DataTable value={ProductStored} loading={loading} rows={8} paginator paginatorLeft>
                    <Column field='product' header="Product Name"></Column>
                    <Column field='model' header="Model"></Column>
                    <Column field='serial_num' header="Serial Number"></Column>
                    <Column field='quantity' header="Quantity"></Column>
                    <Column field='price' body={PriceFormat} header="Price"></Column>
                    <Column field='status' body={StatusProduct} header="Status"></Column>
                    <Column field='id' body={ActionBtn} header="Actions"></Column>
                </DataTable>
            </Card>

            <Dialog onHide={hidemodal} header="Product Details" visible={updatemodal} style={{ width: '50vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }} position='top' draggable={false}>
                <form onSubmit={UpdateData} id='update_form'>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Product Name
                                </label>
                                <InputText className='w-100' name='product' value={EditData.product} onChange={updatechange} />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Brand
                                </label>
                                <InputText className='w-100' name='brand' value={EditData.brand} onChange={updatechange} />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Model
                                </label>
                                <InputText className='w-100' name='product' value={EditData.model} onChange={updatechange} />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Serial Number
                                </label>
                                <InputText className='w-100' name='serial_num' value={EditData.serial_num} onChange={updatechange} />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Quantity
                                </label>
                                <InputText className='w-100' name='quantity' value={EditData.quantity} onChange={updatechange} />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Product Price
                                </label>
                                <InputText className='w-100' name='price' value={EditData.price} onChange={updatechange} />
                            </div>

                        </div>
                        <div className="mt-3 d-flex justify-content-end">
                            <Button className='p-button-sm p-button-success' label='Update Data'/>
                        </div>
                    </div>
                </form>
            </Dialog>

            <Dialog onHide={hidemodal} header="Add Product" style={{ width: '50vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }} position='top' draggable={false} visible={visible}>
                <form id='form_add' onSubmit={CreateProduct}>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Name of Product
                                </label>
                                <InputText onChange={handleinput} className='w-100' name='product' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Brand
                                </label>
                                <InputText className='w-100' onChange={handleinput} name='brand' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Model
                                </label>
                                <InputText className='w-100' onChange={handleinput} name='model' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Serial Number
                                </label>
                                <InputText className='w-100' onChange={handleinput} name='serial' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Quantity
                                </label>
                                <InputText keyfilter={'int'} className='w-100' onChange={handleinput} name='pcs' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Product Price
                                </label>
                                <InputText className='w-100' name='price' onChange={handleinput} />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Description
                                </label>
                                <InputTextarea className='w-100' name='desc' rows={5} cols={5} onChange={handleinput} />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Image
                                </label>
                                <InputText onChange={handlefile} type='file' className='w-100' />
                            </div>
                        </div>
                        <div className="mt-3 d-flex justify-content-end">
                            <Button className='p-button-sm p-button-info' label='Register Product' />
                        </div>
                    </div>
                </form>
            </Dialog>
        </div>
    )
}

export default Product