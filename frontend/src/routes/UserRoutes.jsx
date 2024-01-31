import Logs from "../components/Users/pages/Activity/Logs";
import Branch from "../components/Users/pages/Branch/Branch";
import MonitorTransfer from "../components/Users/pages/Branch/MonitorTransfer";
import Received from "../components/Users/pages/Branch/Received";
import TransferProduct from "../components/Users/pages/Branch/TransferProduct";
import Dashboard from "../components/Users/pages/Dashboard/Dashboard";
import Employee from "../components/Users/pages/Employee/Employee";
import Customer from "../components/Users/pages/Form/Customer";
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
    {path: "/user/branch", exact: true, name: "Transaction", component: Branch},
    {path: "/user/branch/transfer/refid:id", exact: true, name: "Transaction", component: TransferProduct},
    {path: "/user/branch/monitor", exact: true, name: "Transaction", component: MonitorTransfer},
    {path: "/user/branch/receive", exact: true, name: "Transaction", component: Received},
    {path: "/user/transaction/form:id", exact: true, name: "Transaction", component: Customer},
];

export default UserRoutes;