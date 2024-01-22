import axios from 'axios'
import moment from 'moment'
import { PrimeIcons } from 'primereact/api'
import { Badge } from 'primereact/badge'
import { Button } from 'primereact/button'
import { Card } from 'primereact/card'
import { Column } from 'primereact/column'
import { DataTable } from 'primereact/datatable'
import { Dialog } from 'primereact/dialog'
import { Dropdown } from 'primereact/dropdown'
import { InputText } from 'primereact/inputtext'
import { Toast } from 'primereact/toast'
import React, { useEffect, useRef, useState } from 'react'
import swal from 'sweetalert'

function Employee() {

    const [visible , setVisible] = useState(false)
    const [AddEmployee, setAdd] = useState({
        employee: "",
        email: "",
        error: [],
    });
    const [loading, setLoading] = useState(true);
    const [ListDataEmp, setLimp] = useState([]);
    const toast = useRef();
    const [RolePick, setPickRole] = useState([]);

    useEffect(() => {
        EmployeeData();
    },[]);


    const EmployeeData = () => {
        axios.get(`/api/DisplayEmployee/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) { 
                setLimp(res.data.data);
            }
            setLoading(false);
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error,response.statusText,'warning');
            }
        })
    }

    const handleInput = (e) => {
        e.persist();
        setAdd({...AddEmployee, [e.target.name] : e.target.value});
    }
    const GetAdd = () => {
        setVisible(true)
    }

    const RoleList = [
        {label: "Driver", value: 4},
        {label: "Employee", value: 3}
    ];

    const HideModal = () => {
        setVisible(false)
    }    

    const RegisterEmployee = (e) => {
        e.preventDefault();

        const data = {
            employee: AddEmployee.employee,
            email: AddEmployee.email,
            user_id: localStorage.getItem('auth_id'),
            role: RolePick,
        };
        axios.post(`/api/AddEmployee`,data).then(res => {
            if(res.data.status === 200) {
                toast.current.show({severity: "success", summary: "Registered Emplyee", detail: "Successfully"});
                document.getElementById('reset').reset();
                setVisible(false)
                EmployeeData();
                setPickRole([]);
            }
            else{
                setAdd({...AddEmployee, error: res.data.data});
            }
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })

    }

    const RoleFormat = (ListDataEmp) => {
        return (
            <>
                {ListDataEmp.role === 4 ? <Badge severity={'warning'} value='Driver' /> : <Badge severity={'success'} value={'Employee'} />}
            </>
        )
    }
    const DateFormat = (ListDataEmp) => {
        return (
            <>
                <span>{moment(ListDataEmp.created_at).format('MMM DD YYYY hh:mm a')}</span>
            </>
        )
    }
    
    return (
        <div className='mt-3'>
            <Toast ref={toast} />
            <Card title="Employee Data">
                <div className="d-flex justify-content-end mb-3">
                    <Button onClick={GetAdd} className='p-button-sm p-button-info' label='Register Employee' icon={PrimeIcons.PLUS} />
                </div>
                <DataTable value={ListDataEmp} loading={loading} paginator rows={8} paginatorLeft>
                    <Column field='employee' header="Name of Employee"></Column>
                    <Column field='email' header="Email"></Column>
                    <Column field='role' body={RoleFormat} header="Role"></Column>
                    <Column field='created_at' body={DateFormat} header="Employee Registered"></Column>
                </DataTable>
            </Card>

            <Dialog header="Add Employee" onHide={HideModal} visible={visible} style={{ width: '50vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }} position='top' draggable={false} >
                <form onSubmit={RegisterEmployee} id='reset'>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Name of Employee
                                </label>
                                <InputText className='w-100' onChange={handleInput} name='employee'  />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Email
                                </label>
                                <InputText className='w-100' name='email' onChange={handleInput} />
                            </div>
                        </div>
                        <div className="col-lg-12 mb-2">
                            <label htmlFor="" className="form-label">
                                Role
                            </label>
                            <Dropdown value={RolePick} onChange={(e) => setPickRole(e.target.value)} options={RoleList} className='w-100' placeholder='Employee Role' name='role' />
                        </div>
                    </div>
                    <div className="mt-3 d-flex justify-content-end">
                        <Button className='p-button-sm p-button-info' label='Add Employee' />
                    </div>
                </form>
            </Dialog>
        </div>
    )
}

export default Employee