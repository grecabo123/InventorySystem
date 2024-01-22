import { Card } from 'primereact/card'
import { Column } from 'primereact/column'
import { DataTable } from 'primereact/datatable'
import React from 'react'

function Distribute() {
    return (
        <div className='mt-3'>
            <Card>
                <DataTable paginator paginatorLeft rows={8}>
                    <Column></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Distribute