import Logs from "../components/Users/pages/Activity/Logs";
import Dashboard from "../components/Users/pages/Dashboard/Dashboard";
import Employee from "../components/Users/pages/Employee/Employee";
import Monitoring from "../components/Users/pages/Product/Monitoring";
import Request from "../components/Users/pages/Product/Request";
import Sold from "../components/Users/pages/Product/Sold";
import Transfer from "../components/Users/pages/Product/Transfer";
import Transaction from "../components/Users/pages/Transaction/Transaction";


const UserRoutes = [
    {path: "/user/dashboard", exact: true, name: "Dashbaord", component: Dashboard},
    {path: "/user/logs", exact: true, name: "Logs", component: Logs},
    {path: "/user/employee", exact: true, name: "Employee", component: Employee},
    {path: "/user/monitor", exact: true, name: "Monitor", component: Monitoring},
    {path: "/user/request", exact: true, name: "Request", component: Request},
    {path: "/user/sold", exact: true, name: "Sold", component: Sold},
    {path: "/user/transfer", exact: true, name: "Transfer", component: Transfer},
    {path: "/user/transaction", exact: true, name: "Transaction", component: Transaction},
];

export default UserRoutes;