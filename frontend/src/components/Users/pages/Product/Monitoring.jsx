import axios from 'axios';
import { Badge } from 'primereact/badge';
import { Button } from 'primereact/button';
import { Card } from 'primereact/card'
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable'
import React, { useEffect, useState } from 'react'
import { Link } from 'react-router-dom/cjs/react-router-dom';
import swal from 'sweetalert';

function Monitoring() {

    const [loading, setLoading] = useState(true);
    const [Products, setProduct] = useState([]);

    useEffect(() => {
        axios.get(`/api/MonitorStocks/${localStorage.getItem('auth_id')}`).then(res => {
            if (res.data.status === 200) {
                setProduct(res.data.data)
            }
            setLoading(false)
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }, []);

    const StatusCheck = (Products) => {
        return (
            <>
                {
                    Products.pcs <= 0 ? <Badge severity={'danger'} value={'Out of Stock'} /> : <Badge severity={'success'} value={'Stock'} />
                }
            </>
        )
    }

    const ActionButton = (Product) => {
        return (
            <>
                {
                    Product.pcs == 0 ? "" : <Link to={`/user/transaction/form=${Product.serial_num}`}>
                    <Button
                        className='p-button-info p-button-sm'
                        label='Transaction'
                        data-product-id={Product.id}
                        data-product={Product.product}
                        data-brand={Product.brand}
                        data-model={Product.model}
                        data-serial={Product.serial_num}
                        data-price={Product.price}
                        onClick={GetDataDetails}
                    />
                </Link>
                }
            </>
        )
    }

    const GetDataDetails = (e) => {
        localStorage.setItem('form_product_id', e.currentTarget.getAttribute('data-product-id'))
        localStorage.setItem('form_product_name', e.currentTarget.getAttribute('data-product'))
        localStorage.setItem('form_product_brand', e.currentTarget.getAttribute('data-brand'))
        localStorage.setItem('form_product_model', e.currentTarget.getAttribute('data-model'))
        localStorage.setItem('form_product_serial', e.currentTarget.getAttribute('data-serial'))
        localStorage.setItem('form_product_price', e.currentTarget.getAttribute('data-price'))
    }

    const PriceFormat = (Product) => {
        return (
            <>
               ₱<span>{Product.price.toLocaleString('en-US', { minimumFractionDigits: 2 })}</span>
            </>
        )
    }

    return (
        <div className='mt-3'>
            <Card title="Monitor Product Stocks">
                <DataTable value={Products} paginator paginatorLeft rows={9} loading={loading}>
                    <Column field='product' header="Product Name"></Column>
                    <Column field='brand' header="Product Brand"></Column>
                    <Column field='model' header="Product Model"></Column>
                    <Column field='serial_num' header="Serial Number"></Column>
                    <Column field='price' body={PriceFormat} header="Product Price"></Column>
                    <Column field='pcs' header="Quantity"></Column>
                    <Column field='status' body={StatusCheck} header="Status"></Column>
                    <Column field='id' body={ActionButton} header="Action"></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Monitoring