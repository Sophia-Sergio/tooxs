import React, { Component } from 'react';
import PropTypes from 'prop-types';
// Planificación de ventas
import StatisticsIcon from '../images/icons/line-charts.svg';
import ComparativeIcon from '../images/icons/bar-chart.svg';
import ChangePlanIcon from '../images/icons/ballpoint-pen.svg';
import EmployeesIcon from '../images/icons/business-user.svg';
import DotationIcon from '../images/icons/collaboration.svg';
// Productividad
import OptimizeIcon from '../images/icons/time.svg';
import AnalysisIcon from '../images/icons/horizontal-bar-chart.svg';
// Reportabilidad
import DotationPlanIcon from '../images/icons/check-clipboard.svg';
import DotationProdIcon from '../images/icons/suitcase.svg';
import ProductivityIcon from '../images/icons/coins.svg';
import ComparativeReportIcon from '../images/icons/statistics.svg';
import EfficiencyIcon from '../images/icons/stock.svg';
import CoverageIcon from '../images/icons/pin-note.svg';
// Disponibilizador
import MakeAvailableIcon from '../images/icons/wi-time-10.svg';
import RequestIcon from '../images/icons/write-check.svg';
// Administración
import StoresIcon from '../images/icons/office-building.svg';
import DepartmentsIcon from '../images/icons/hanger.svg';
import ShiftsIcon from '../images/icons/shifts.svg';
import UsersIcon from '../images/icons/users.svg';
import SalesPlanIcon from '../images/icons/notebook.svg';
import RealSalesIcon from '../images/icons/check-clipboard.svg';
import EmployeesSalesIcon from '../images/icons/sells.svg';
import StaffingIcon from '../images/icons/business-users.svg';


class SidebarItem extends Component {
  state = {
    menuItems: [
      {
        id: 1,
        name: 'Planificación de ventas',
        menu: [
          {
            id: 1,
            active: true,
            name: 'Estadísticas',
            icon: StatisticsIcon,
            link: '/sales/month/'
          },
          {
            id: 2,
            active: false,
            name: 'Comparativo',
            icon: ComparativeIcon,
            link: '/sales_cluster/month/'
          },
          {
            id: 3,
            active: false,
            name: 'Cambiar plan',
            icon: ChangePlanIcon,
            link: '/config/change_plan/'
          },
          {
            id: 4,
            active: false,
            name: 'Colaboradores',
            icon: EmployeesIcon,
            link: '/sellers/'
          },
          {
            id: 5,
            active: false,
            name: 'Dotación',
            icon: DotationIcon,
            link: '/staffing/index/'
          }
        ]
      },
      {
        id: 2,
        name: 'Productividad',
        menu: [
          {
            id: 1,
            active: false,
            name: 'Optimizar turnos',
            icon: OptimizeIcon,
            link: '/sales/month/'
          },
          {
            id: 2,
            active: false,
            name: 'Análisis de horas',
            icon: AnalysisIcon,
            link: '/sales_cluster/month/'
          },
        ]
      },
      {
        id: 3,
        name: 'Reportabilidad',
        menu: [
          {
            id: 1,
            active: false,
            name: 'Planificación dotación',
            icon: DotationPlanIcon,
            link: '/sellers/staff/'
          },
          {
            id: 2,
            active: false,
            name: 'Dotación produccción',
            icon: DotationProdIcon,
            link: '/tottus/dashboard/production/'
          },
          {
            id: 3,
            active: false,
            name: 'Productividad',
            icon: ChangePlanIcon,
            link: '/config/change_plan/'
          },
          {
            id: 4,
            active: false,
            name: 'Comparativo',
            icon: ComparativeReportIcon,
            link: '/productivity_cluster/month?utf8=✓&cluster=1&department=1&year=2018&month=5'
          },
          {
            id: 5,
            active: false,
            name: 'Eficiencia',
            icon: EfficiencyIcon,
            link: '/efficiency/index/'
          },
          {
            id: 6,
            active: false,
            name: 'Cobertura',
            icon: CoverageIcon,
            link: '/sellers/staffing_store/'
          }
        ]
      },
      {
        id: 4,
        name: 'Disponibilizador',
        menu: [
          {
            id: 1,
            active: false,
            name: 'Disponibilizador de turnos',
            icon: MakeAvailableIcon,
            link: '/staff_request/index?departments%5B%5D=1&month=6&store=1&year=2018'
          },
          {
            id: 2,
            active: false,
            name: 'Solicitudes realizadas',
            icon: RequestIcon,
            link: '/staff_request/show/'
          },
        ]
      },
      {
        id: 5,
        name: 'Administración',
        menu: [
          {
            id: 1,
            active: false,
            name: 'Tiendas',
            icon: StoresIcon,
            link: '/stores/'
          },
          {
            id: 2,
            active: false,
            name: 'Departamentos',
            icon: DepartmentsIcon,
            link: '/departments/'
          },
          {
            id: 3,
            active: false,
            name: 'Turnos',
            icon: ShiftsIcon,
            link: '/available_shifts/'
          },
          {
            id: 4,
            active: false,
            name: 'Usuarios',
            icon: UsersIcon,
            link: '/users/'
          },
          {
            id: 5,
            active: false,
            name: 'Plan de ventas',
            icon: SalesPlanIcon,
            link: '/sale_plans/'
          },
          {
            id: 6,
            active: false,
            name: 'Ventas reales',
            icon: RealSalesIcon,
            link: '/sale_reals/'
          },
          {
            id: 7,
            active: false,
            name: 'Ventas por Colaborador',
            icon: EmployeesSalesIcon,
            link: '/sale_by_sellers/'
          },
          {
            id: 8,
            active: false,
            name: 'Dotación real',
            icon: StaffingIcon,
            link: '/staffing_reals/index'
          },
        ]
      }
    ]
  }
  render () {
    const { menuItems } = this.state;

    return (
      <React.Fragment>
        {menuItems.map(item => (
          <div key={item.id} className="sidebar__menu__item">
            <h4>{item.name}</h4>
            <ul className="sidebar__menu__item__list">
              {item.menu.map(li => (
                <li key={li.id}>
                  <a className={li.active ? 'active' : ''} href={li.link}>
                    <img src={li.icon} alt={li.name} />
                    <span>{li.name}</span>
                  </a>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </React.Fragment>
    );
  }
}

export default SidebarItem