import axios from 'axios'
import moment from 'moment'
import { Button } from 'primereact/button'
import { Card } from 'primereact/card'
import { Divider } from 'primereact/divider'
import { InputNumber } from 'primereact/inputnumber'
import { InputText } from 'primereact/inputtext'
import { InputTextarea } from 'primereact/inputtextarea'
import { Panel } from 'primereact/panel'
import { Toast } from 'primereact/toast'
import React, { useRef, useState } from 'react'
import { Link, useHistory } from 'react-router-dom/cjs/react-router-dom'
import swal from 'sweetalert'

function Customer() {

    const history = useHistory();
    const [Data, setData] = useState({
        name: "",
        address: "",
        description: "",
    });
    const toast = useRef();
    const [pcs, setpcs] = useState()

    const handleinput = (e) => {
        e.persist();
        setData({ ...Data, [e.target.name]: e.target.value });
    }

    const SubmitForm = (e) => {
        e.preventDefault();

        const data = {
            product_id: localStorage.getItem('form_product_id'),
            name: Data.name,
            address: Data.address,
            desc: Data.description,
            quan: pcs,
            product_name: localStorage.getItem('form_product_name'),
            product_brand: localStorage.getItem('form_product_brand'),
            product_model: localStorage.getItem('form_product_model'),
            product_serial: localStorage.getItem('form_product_serial'),
            product_price: localStorage.getItem('form_product_price'),
            user_fk: localStorage.getItem('auth_id'),
            invoice: moment().format('MMDDYY')
        };

        axios.put(`/api/SubmitForm`, data).then(res => {
            if (res.data.status === 200) {
                toast.current.show({
                    severity: "success",
                    summary: "Submitted Form",
                    detail: "Successfully",
                })
                document.getElementById('form').reset();
                setTimeout(() => {
                    history.push('/user/monitor');
                },1500)
            }
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })

    }

    const RemoveStore = () => {
        localStorage.removeItem('product_name');
        localStorage.removeItem('form_product_id');
        localStorage.removeItem('form_product_name');
        localStorage.removeItem('form_product_brand');
        localStorage.removeItem('form_product_model');
        localStorage.removeItem('form_product_serial');
        localStorage.removeItem('form_product_price');
        localStorage.removeItem('form_product_pcs');
    }
    const header = <>
        <div className="d-flex justify-content-between align-items-center p-3">
            <span className='text-light'>{localStorage.getItem('form_product_name')}</span>
            <Link to={`/user/monitor`}>
                <Button onClick={RemoveStore} className='p-button-sm p-button-success' label='Cancel' />
            </Link>
        </div>
    </>


    return (
        <div className='mt-3'>
            <Toast ref={toast} />
            <Panel headerTemplate={header}>
                <h3 className='text-center mt-3'>Customer Form</h3>
                <form id='form' onSubmit={SubmitForm}>
                    <div className="container p-3">
                        <div className="row">
                            <Divider>
                                <p className='p-tag'>Product Details</p>
                            </Divider>

                            <div className="col-lg-6 mb-2">
                                <label htmlFor="" className="form-label">
                                    Product Name
                                </label>
                                <InputText className='w-100' value={localStorage.getItem('form_product_name')} readOnly />
                            </div>
                            <div className="col-lg-6 mb-2">
                                <label htmlFor="" className="form-label">
                                    Product Brand
                                </label>
                                <InputText className='w-100' value={localStorage.getItem('form_product_brand')} readOnly />
                            </div>
                            <div className="col-lg-6 mb-2">
                                <label htmlFor="" className="form-label">
                                    Product Model
                                </label>
                                <InputText className='w-100' value={localStorage.getItem('form_product_model')} readOnly />
                            </div>
                            <div className="col-lg-6 mb-2">
                                <label htmlFor="" className="form-label">
                                    Serial Number
                                </label>
                                <InputText className='w-100' value={localStorage.getItem('form_product_serial')} readOnly />
                            </div>
                            <div className="col-lg-6 mb-2">
                                <label htmlFor="" className="form-label">
                                    Price
                                </label>
                                <InputNumber required className='w-100' readOnly value={localStorage.getItem('form_product_price')} />
                            </div>
                            <div className="col-lg-6 mb-2">
                                <label htmlFor="" className="form-label">
                                    Number of Products Available
                                </label>
                                <InputNumber required className='w-100' readOnly value={localStorage.getItem('form_product_pcs')} />
                            </div>
                            <div className="col-lg-6 mb-2">
                                <label htmlFor="" className="form-label">
                                    Quantity
                                </label>
                                <InputNumber value={pcs == 0 ? "" : pcs} className='w-100' onChange={(e) => setpcs(e.value)} />
                                {pcs > localStorage.getItem('form_product_pcs') ? <small className='text-danger'>Exceed Quantity</small> : "" }
                            </div>
                            <div className="col-lg-12 mb-2">
                                <span>Total Price: {pcs == null ? "" : '₱' +( localStorage.getItem('form_product_price') * pcs).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</span>
                            </div>
                            <Divider>
                                <span className='p-tag'>Customer Details</span>
                            </Divider>
                            <div className="mt-2">
                                <div className="row">
                                    <div className="col-lg-6 mb-2">
                                        <label htmlFor="" className="form-label">
                                            Customer Name
                                        </label>
                                        <InputText className='w-100' onChange={handleinput} name='name' />
                                    </div>
                                    <div className="col-lg-6 mb-2">
                                        <label htmlFor="" className="form-label">
                                            Complete Address
                                        </label>
                                        <InputText className='w-100' onChange={handleinput} name='address' />
                                    </div>
                                    <div className="col-lg-12 mb-2">
                                        <label htmlFor="" className="form-label">
                                            Description
                                        </label>
                                        <InputTextarea className='w-100' rows={5} cols={5} name='description' onChange={handleinput} />
                                    </div>
                                    <div className="mt-3">
                                        <Button disabled={pcs > localStorage.getItem('form_product_pcs') ? true : false  } className='p-button-info p-button-sm' label='Submit' />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </Panel>
        </div>
    )
}

export default Customer