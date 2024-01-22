import { PrimeIcons } from 'primereact/api'
import { Button } from 'primereact/button'
import { Card } from 'primereact/card'
import { Column } from 'primereact/column'
import { DataTable } from 'primereact/datatable'
import React, { useEffect, useRef, useState } from 'react'
import { Dialog } from 'primereact/dialog';
import { InputText } from 'primereact/inputtext'
import axios from 'axios'
import swal from 'sweetalert'
import { Toast } from 'primereact/toast'
import { Badge } from 'primereact/badge'
import { Dropdown } from 'primereact/dropdown'


function Employee() {

    const toast = useRef();
    const [loading, setloading] = useState(true)
    const [ListData, setList] = useState([]);
    const [loadingbtn, setbtn] = useState(false);
    const [visible, setVisible] = useState(false)
    const [visibledetails, setVisibledetails] = useState(false)
    const [categoryid, setCategory] = useState([]);
    const [Indicate, setIncidate] = useState({
        indicator: "",
        fname: "",
        mname: "",
        lname: "",
        email: "",
        username: "",
        brgy: "",
        province: "",
        zip: "",
        street: "",
        region: "",
        city: "",
        status: "",
        user_id: "",
    });
    const [Add, setAdd] = useState({
        fname: "",
        mname: "",
        lname: "",
        email: "",
        username: "",
        brgy: "",
        province: "",
        zip: "",
        street: "",
        region: "",
        city: "",
        error: [],
    });

    useEffect(() => {
        FetchData();
    },[]);

    const FetchData = () => {
        axios.get(`/api/ListEmployee`).then(res => {
            if(res.data.status === 200) {
                setList(res.data.data);
            }
            setloading(false)
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    }

    const handleinput = (e) => {
        e.persist();
        setAdd({...Add, [e.target.name] : e.target.value});
    }

    const AddEmployee = () => {
        setVisible(true)
    }
    const HideAdd = () => {
        setVisible(false)
        setVisibledetails(false)

    }

    const RegisterEmployee = (e) => {
        e.preventDefault();
        setbtn(true)
        const data = {
            fname: Add.fname,
            mname: Add.mname,
            lname: Add.lname,
            email: Add.email,
            username: Add.username,
            region: Add.region,
            province: Add.province,
            city: Add.city,
            street: Add.street,
            brgy: Add.brgy,
            zip: Add.zip,
            role: categoryid,
        };

        axios.post(`/api/AddEmployee`,data).then(res => {
            if(res.data.status === 200) {
                FetchData();
                toast.current.show({severity: "success", summary: "Added Employee", detail: "Successfully"});
                setVisible(false)
                setbtn(false)
                document.getElementById('form').reset();
            }
            else{
                setbtn(false)
                setAdd({...Add, error: res.data.error});
            }
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
                setbtn(false)

            }
        })

    }

    const NamePerson = (ListData) => {
        return (
            <>
                <span>{ListData.first_name} {ListData.middle_name} {ListData.last_name}</span>
            </>
        )
    }

    const StatusAccount = (ListData) => {
        return (
            <>
                {
                    ListData.status === 1 ? <Badge className='p-badge' severity={'success'} value={'Active'} />
                    :
                    <Badge className='p-badge' severity={'danger'} value={'Deactivate'} />
                }
            </>
        )
    }

    const ButtonAction = (ListData) => {
        return (
            <>
                <Button 
                className='p-button-sm p-button-info m-2' 
                data-indicator={1} 
                onClick={GetDetails} 
                data-id={ListData.id}
                label='Details' 
                data-email={ListData.email}
                data-zipcode={ListData.zipcode}
                data-city={ListData.city}
                data-streets={ListData.streets}
                data-region={ListData.region}
                data-province={ListData.province}
                data-username={ListData.username}
                data-brgy_name={ListData.brgy_name}

                />

                <Button 
                className={ListData.status == 1 ? 'p-button-sm p-button-danger m-2' : 'p-button-sm p-button-success m-2'} 
                data-user={ListData.id} 
                data-status={ListData.status} 
                data-indicator={2} 
                onClick={GetDetails} 
                label={ListData.status == 1 ? "Deactivate" : "Activate"} 
                />
            </>
        )
    }

    const GetDetails = (e) => {
        setVisibledetails(true)
        setIncidate({
            indicator: e.currentTarget.getAttribute('data-indicator'),
            status: e.currentTarget.getAttribute('data-status'),
            user_id: e.currentTarget.getAttribute('data-user'),
            email: e.currentTarget.getAttribute('data-email'),                        
            zipcode: e.currentTarget.getAttribute('data-zipcode'),                        
            city: e.currentTarget.getAttribute('data-city'),                        
            streets: e.currentTarget.getAttribute('data-streets'),                        
            region: e.currentTarget.getAttribute('data-region'),                        
            province: e.currentTarget.getAttribute('data-province'),                        
            username: e.currentTarget.getAttribute('data-username'),                        
            brgy: e.currentTarget.getAttribute('data-brgy_name'),                        
        });
    }

    const UpdateStatus = (e) => {
        e.preventDefault();

        const data = {
            status: Indicate.status,
            id: Indicate.user_id,
        };

        axios.put(`/api/UpdateStatus`,data).then(res => {
            if(res.data.status === 200) {
                toast.current.show({severity: "success", summary: "Update Status", detail: "Successfully"});
                FetchData();
                setVisibledetails(false);
            }
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    }

    const Category = [
        {label: "Manager", value: 2},
        {label: "Employee", value: 3},
    ];
    

    return (
        <div className='mt-3'>
            <Toast ref={toast} />
            <Card title="Employee Record">
                <div className="d-flex justify-content-end">
                    <Button className='p-button-sm p-button-info' onClick={AddEmployee} label='Regiser Employee' icon={PrimeIcons.PLUS} />
                </div>
                <DataTable value={ListData} loading={loading} rows={9} paginator paginatorLeft>
                    <Column field='name' body={NamePerson} header="Name"></Column>
                    <Column field='email'  header="Email"></Column>
                    <Column field='username'  header="Username"></Column>
                    <Column field='status' body={StatusAccount} header="Status"></Column>
                    <Column field='id' body={ButtonAction}  header="Actions"></Column>
                </DataTable>
            </Card>

            <Dialog header="Register Employee" onHide={HideAdd} style={{ width: '50vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }} visible={visible} draggable={false} position='top'>
                <form onSubmit={RegisterEmployee} id='reset'>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-6 mb-3">
                                <label htmlFor="" className="form-label">
                                    First Name
                                </label>
                                <InputText className='w-100 p-inputtext-sm' onChange={handleinput} name='fname' />
                            </div>
                            <div className="col-lg-6 mb-3">
                                <label htmlFor="" className="form-label">
                                    Middle Name
                                </label>
                                <InputText onChange={handleinput} className='w-100 p-inputtext-sm' name='mname' />
                            </div>
                            <div className="col-lg-6 mb-3">
                                <label htmlFor="" className="form-label">
                                    Last Name
                                </label>
                                <InputText onChange={handleinput} className='w-100 p-inputtext-sm' name='lname' />
                            </div>
                            <div className="col-lg-6 mb-3">
                                <label htmlFor="" className="form-label">
                                    Email
                                </label>
                                <InputText type='email' keyfilter={'email'} onChange={handleinput} className='w-100 p-inputtext-sm' name='email' />
                            </div>
                            <div className="col-lg-6 mb-3">
                                <label htmlFor="" className="form-label">
                                    Username
                                </label>
                                <InputText className='w-100 p-inputtext-sm' onChange={handleinput} name='username' />
                            </div>
                            <div className="col-lg-6 mb-3">
                                <label htmlFor="" className="form-label">
                                    Category
                                </label>
                                <Dropdown options={Category} value={categoryid} onChange={(e) => setCategory(e.target.value)} className='w-100 p-inputtext-sm' placeholder='Category' />
                                {/* <InputText className='w-100 p-inputtext-sm' name='region' onChange={handleinput} /> */}
                            </div>
                            <div className="col-lg-6 mb-3">
                                <label htmlFor="" className="form-label">
                                    Region
                                </label>
                                <InputText className='w-100 p-inputtext-sm' name='region' onChange={handleinput} />
                            </div>
                            <div className="col-lg-6 mb-3">
                                <label htmlFor="" className="form-label">
                                    Province
                                </label>
                                <InputText className='w-100 p-inputtext-sm' name='province' onChange={handleinput} />
                            </div>
                            <div className="col-lg-6 mb-3">
                                <label htmlFor="" className="form-label">
                                    City
                                </label>
                                <InputText className='w-100 p-inputtext-sm' name='city' onChange={handleinput} />
                            </div>
                            <div className="col-lg-6 mb-3">
                                <label htmlFor="" className="form-label">
                                    Street
                                </label>
                                <InputText onChange={handleinput} className='w-100 p-inputtext-sm' name='street' />
                            </div>
                            <div className="col-lg-6 mb-3">
                                <label htmlFor="" className="form-label">
                                    Barangay
                                </label>
                                <InputText onChange={handleinput} className='w-100 p-inputtext-sm' name='brgy' />
                            </div>
                            <div className="col-lg-6 mb-3">
                                <label htmlFor="" className="form-label">
                                    Zip Code
                                </label>
                                <InputText keyfilter={'pint'} onChange={handleinput} className='w-100 p-inputtext-sm' name='zip' />
                            </div>
                        </div>
                        <div className="mt-3 d-flex justify-content-end">
                            <Button loading={loadingbtn} className='p-button-sm p-button-success' label='Register' />
                        </div>
                    </div>
                </form>
            </Dialog>

            <Dialog header={Indicate.indicator == 1 ? "Details" : "Account Status"} visible={visibledetails} onHide={HideAdd} position='top' draggable={false} style={{ width: '50vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }}>
                {
                    Indicate.indicator == 1 
                    ?
                    <form></form>
                    :
                   <>
                     <p>Would you like to {Indicate.status == 1 ? "Deactivate" : "Activate"} this account?</p>
                     <div className="mt-3">
                        <div className="d-flex justify-content-end">
                            <Button 
                                className={Indicate.status == 1 ? 'p-button-danger p-button-sm' : 'p-button-sm p-button-success'} 
                                label={Indicate.status == 1 ? 'Deactivate' : "Activate"}
                                onClick={UpdateStatus}
                            />
                        </div>
                     </div>
                   </>
                    

                }
            </Dialog>
        </div>
    )
}

export default Employee