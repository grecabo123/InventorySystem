import axios from 'axios'
import { PrimeIcons } from 'primereact/api'
import { Button } from 'primereact/button'
import { Card } from 'primereact/card'
import { Column } from 'primereact/column'
import { DataTable } from 'primereact/datatable'
import { Dialog } from 'primereact/dialog'
import { InputText } from 'primereact/inputtext'
import { Toast } from 'primereact/toast'
import React, { useEffect, useRef, useState } from 'react'
import swal from 'sweetalert'
import moment from 'moment'
import { Mention } from 'primereact/mention'
import { Divider } from 'primereact/divider'
import { Badge } from 'primereact/badge'

function Stores() {

    const [visible, setVisible] = useState(false);
    const [loading, setloading] = useState(true);
    const [create, setCreate] = useState({
        branch: "",
        region: "",
        province: "",
        city: "",
        streets: "",
        brgy: "",
        zipcode: "",
        error: [],
    });
    const [suggestions, setSuggestions] = useState([]);
    const [emailchoose, setemailchoose] = useState("")
    const [StoreData, setStore] = useState([]);
    const [assignmodal, setassign] = useState(false);
    const [details, setDetails] = useState({
        id: "",
        name: "",
    });
    const [NameTags, setRemoveNames] = useState([]);
    const [managerdata, setmanager] = useState([])

    useEffect(() => {
        getStore();
    }, [])

    useEffect(() => {
        axios.get(`/api/Manager`).then(res => {
            if (res.data.status === 200) {
                setmanager(res.data.data);
            }
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }, [])

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

    const toast = useRef();
    const CreateStore = () => {
        setVisible(true);
    }
    const RemoveTagName = RemoveTagEmail => {
        const newTagsNames = NameTags.filter(NameChip => NameChip !== RemoveTagEmail);
        setRemoveNames(newTagsNames)
    }

    const SelectDataEmail = (e) => {
        setemailchoose(e.suggestion.email)
    }
    const onSearch = (e) => {
        setTimeout(() => {
            const query = e.query;
            let suggestions;
            if (managerdata === "No Accounts") {
                return false;
            }
            else {
                if (!query.trim().length) {
                    suggestions = [...managerdata];
                }
                else {
                    suggestions = managerdata.filter((email) => {
                        return email.email.toLowerCase().startsWith(query.toLowerCase());
                    });
                }
                setSuggestions(suggestions);
            }
        }, 250);
    }
    const AddTagNames = (e) => {
        e.preventDefault();
        if (NameTags.find(nameTags => nameTags === emailchoose)) {
            alert(emailchoose + " " + "Email is already registered")
            setemailchoose("")
        }
        else {
            if (emailchoose === "") {
                return false;
                // alert("Please Enter Email")
            }
            else {

                if (emailchoose.includes('\n')) {

                }
                setRemoveNames([...NameTags, emailchoose.replace(/\n/g, '')]);
                setemailchoose("");
            }
        }
    }

    const itemTemplate = (suggestion) => {
        return (
            <div className="flex align-items-center">
                <span className="flex flex-column ml-2">
                    <li className='list-item mb-2'> <b>Name</b>:  {suggestion.last_name} {suggestion.first_name} {suggestion.middle_name}</li>
                    <li className='list-item mb-2'><b>Email</b>: {suggestion.email}</li>
                    <Divider />
                </span>
            </div>
        );
    }

    const EmailInput = (e) => {
        setemailchoose(e.target.value);
    }



    const handleinput = (e) => {
        e.persist();
        setCreate({ ...create, [e.target.name]: e.target.value });
    }

    const hideModal = () => {
        setVisible(false)
        setassign(false)
    }

    const CreateStoreData = (e) => {
        e.preventDefault();

        const data = {
            branch: create.branch,
            region: create.region,
            province: create.province,
            city: create.city,
            streets: create.streets,
            brgy: create.brgy,
            zipcode: create.zipcode,
            user_fk: localStorage.getItem('auth_id'),
        };
        axios.post(`/api/CreateStore`, data).then(res => {
            if (res.data.status === 200) {
                toast.current.show({ severity: "success", summary: `Create Store` + ' ' + data.branch, detail: "Successfully" });
                document.getElementById('form_reset').reset();
                getStore();
                setVisible(false);
            }
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }

    const FormatDate = (StoreData) => {
        return (
            <>
                <span>{moment(StoreData.created_at).format('MMM DD YYYY')}</span>
            </>
        )
    }
    const NameManager = (StoreData) => {
        return (
            <>
                <span>{StoreData.last_name} {StoreData.first_name} {StoreData.middle_name}</span>
            </>
        )
    }

    const ButtonAction = (StoreData) => {
        return (
            <>
                <Button className='p-button-sm me-2 p-button-info' data-id={StoreData.id} label='Details' />
                <Button className='p-button-sm me-2 p-button-warning' onClick={ActionsStore} data-id={StoreData.id} label='Assign' />
            </>
        )
    }

    const ActionsStore = (e) => {
        setassign(true);
        setDetails({
            id: e.currentTarget.getAttribute('data-id'),
        });

    }
    const AssignManager = (e) => {
        e.preventDefault();

        const data = {
            name: NameTags[0],
            store_id: details.id,
        };
        // console.log(data);
        axios.put(`/api/AssignManager`, data).then(res => {
            if (res.data.status === 200) {
                toast.current.show({ severity: "success", summary: "Assign Store", detail: "Successfully" });
                setassign(false);
                getStore();
                document.getElementById('assign').reset();
            }
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }

    return (
        <div className=' mt-3'>
            <Toast ref={toast} />
            <Card title="All Branches">
                <div className="d-flex justify-content-end">
                    <Button className='p-button-info p-button-sm' onClick={CreateStore} icon={PrimeIcons.PLUS} label='Create Store' />
                </div>
                <DataTable value={StoreData} paginator paginatorLeft rows={8} loading={loading}>
                    <Column field='store_name' header="Name of Store"></Column>
                    <Column field='last_name' body={NameManager} header="Manager"></Column>
                    <Column field='province' header="Province"></Column>
                    <Column field='city' header="City"></Column>
                    <Column field='created_at' body={FormatDate} header="Created"></Column>
                    <Column field='id' body={ButtonAction} header="Actions"></Column>
                </DataTable>
            </Card>

            <Dialog onHide={hideModal} header="Create Store" style={{ width: '50vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }} position='top' draggable={false} visible={visible}>
                <form onSubmit={CreateStoreData} id='form_reset'>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Name of Branch
                                </label>
                                <InputText onChange={handleinput} className='w-100 p-inputtext-sm' name='branch' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Region
                                </label>
                                <InputText onChange={handleinput} className='w-100 p-inputtext-sm' name='region' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Province
                                </label>
                                <InputText onChange={handleinput} className='w-100 p-inputtext-sm' name='province' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    City
                                </label>
                                <InputText onChange={handleinput} className='w-100 p-inputtext-sm' name='city' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Streets
                                </label>
                                <InputText onChange={handleinput} className='w-100 p-inputtext-sm' name='streets' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Barangay
                                </label>
                                <InputText onChange={handleinput} className='w-100 p-inputtext-sm' name='brgy' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    ZipCode
                                </label>
                                <InputText onChange={handleinput} keyfilter={'pint'} className='w-100 p-inputtext-sm' name='zipcode' />
                            </div>
                        </div>
                        <div className="mt-3 d-flex justify-content-end">
                            <Button className='p-button-sm p-button-info' label='Create Store' />
                        </div>
                    </div>
                </form>
            </Dialog>

            <Dialog header="Assign" onHide={hideModal} style={{ width: '50vw' }} maximizable={true} position='top' draggable={false} visible={assignmodal}>
                <form onSubmit={AssignManager} id='assign'>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12">
                                <label htmlFor="" className="form-label">
                                    Name of Person
                                </label>
                                <div className="p-inputgroup">
                                    <Mention placeholder='Type @ to search Name' scrollHeight='400px' rows={1}
                                        className='w-100 p-mention'
                                        // autoResize={true}
                                        style={{ resize: 'none !important' }}
                                        field="email"
                                        trigger="@"
                                        onSelect={SelectDataEmail}
                                        itemTemplate={itemTemplate}
                                        onSearch={onSearch}
                                        suggestions={suggestions}
                                        value={emailchoose}
                                        onChange={EmailInput}
                                    />

                                    <Button
                                        className='p-button-sm p-button-info'
                                        label='Add'
                                        onClick={AddTagNames}
                                        icon={PrimeIcons.PLUS} />
                                </div>
                                {

                                    NameTags.map((NameChip, index) => {
                                        return (
                                            <>
                                                <Badge className='me-3 ' key={index} value={NameChip} severity="info">{NameChip}</Badge>
                                                <button className='me-5 border-0' onClick={() => RemoveTagName(NameChip)}>X</button>
                                            </>
                                            // <Badge className='me-3' key={index} value={NameChip} severity="info" onClick={() => RemoveTagName(NameChip)}>{NameChip}</Badge>
                                        )
                                    })
                                }
                            </div>
                        </div>
                        <div className="mt-3 d-flex justify-content-end">
                            <Button className='p-button-info p-button-sm' label='Assign' />
                        </div>
                    </div>
                </form>
            </Dialog>
        </div>
    )
}

export default Stores