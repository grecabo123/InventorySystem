import React from 'react'
import { Menubar } from 'primereact/menubar';
import {Button} from 'primereact/button'

function Navigation() {
    return (
        <div>
            <Menubar className=''  end={<Button className='p-button-sm p-button-danger' raised  />} />
        </div>
    )
}

export default Navigation