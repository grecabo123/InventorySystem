import Logs from "../components/Admin/pages/Activity/Logs";
import Dashboard from "../components/Admin/pages/Dashboard/Dashboard";
import Details from "../components/Admin/pages/Distribute/Details";
import Distribute from "../components/Admin/pages/Distribute/Distribute";
import Employee from "../components/Admin/pages/Employee/Employee";
import Transfer from "../components/Admin/pages/Monitor/Transfer";
import Product from "../components/Admin/pages/Product/Product";
import Stores from "../components/Admin/pages/Stores/Stores";


const AdminRoutes = [
    {path: "/admin/dashboard", exact: true, name: "Dasboard", component: Dashboard},
    {path: "/admin/transfer", exact: true, name: "Transfer", component: Transfer},
    {path: "/admin/employee", exact: true, name: "Employee", component: Employee},
    {path: "/admin/store", exact: true, name: "Store", component: Stores},
    {path: "/admin/product", exact: true, name: "Store", component: Product},
    {path: "/admin/distribute", exact: true, name: "Store", component: Distribute},
    {path: "/admin/logs", exact: true, name: "Store", component: Logs},
    {path: "/admin/distribute/refid:id", exact: true, name: "Store", component: Details},
];

export default AdminRoutes;