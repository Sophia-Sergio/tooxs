import React, { Component } from 'react';
import PropTypes from 'prop-types';
// Planificación de ventas
import StatisticsIcon from '../../images/icons/line-charts.svg';
import ComparativeIcon from '../../images/icons/bar-chart.svg';
import ChangePlanIcon from '../../images/icons/ballpoint-pen.svg';
import EmployeesIcon from '../../images/icons/business-user.svg';
import DotationIcon from '../../images/icons/collaboration.svg';
// Productividad
import OptimizeIcon from '../../images/icons/time.svg';
import AnalysisIcon from '../../images/icons/horizontal-bar-chart.svg';
// Reportabilidad
import DotationPlanIcon from '../../images/icons/check-clipboard.svg';
import DotationProdIcon from '../../images/icons/suitcase.svg';
import ProductivityIcon from '../../images/icons/coins.svg';
import ComparativeReportIcon from '../../images/icons/statistics.svg';
import EfficiencyIcon from '../../images/icons/stock.svg';
import CoverageIcon from '../../images/icons/pin-note.svg';
// Disponibilizador
import MakeAvailableIcon from '../../images/icons/wi-time-10.svg';
import RequestIcon from '../../images/icons/write-check.svg';
// Administración
import StoresIcon from '../../images/icons/office-building.svg';
import DepartmentsIcon from '../../images/icons/hanger.svg';
import ShiftsIcon from '../../images/icons/shifts.svg';
import UsersIcon from '../../images/icons/users.svg';
import SalesPlanIcon from '../../images/icons/notebook.svg';
import RealSalesIcon from '../../images/icons/check-clipboard.svg';
import EmployeesSalesIcon from '../../images/icons/sells.svg';
import StaffingIcon from '../../images/icons/business-users.svg';


class SidebarItem extends Component {
  state = {
    menuItems: [
      {
        id: 1,
        name: 'Planificación de ventas',
        menu: [
          {
            id: 1,
            name: 'Estadísticas',
            icon: StatisticsIcon,
            link: '/statistics/sales'
          },
          {
            id: 2,
            name: 'Cambiar plan',
            icon: ChangePlanIcon,
            link: 'https://tooxs-demo.herokuapp.com/config/change_plan'
          },
          {
            id: 3,
            name: 'Colaboradores',
            icon: EmployeesIcon,
            link: '/employees'
          },
          {
            id: 4,
            name: 'Dotación',
            icon: DotationIcon,
            link: '/employees/staff'
          }
        ]
      },
      {
        id: 2,
        name: 'Productividad',
        menu: [
          {
            id: 1,
            name: 'Optimizar turnos',
            icon: OptimizeIcon,
            link: '/optimizer/show/'
          },
          {
            id: 2,
            name: 'Análisis de horas',
            icon: AnalysisIcon,
            link: '/statistics/hours/'
          },
        ]
      },
      {
        id: 3,
        name: 'Reportabilidad',
        menu: [
          {
            id: 1,
            name: 'Planificación dotación',
            icon: DotationPlanIcon,
            link: '/employees/staff_planning/'
          },
          {
            id: 2,
            name: 'Productividad',
            icon: ProductivityIcon,
            link: '/statistics/productivity/'
          },
          {
            id: 3,
            name: 'Eficiencia',
            icon: EfficiencyIcon,
            link: '/statistics/efficiency'
          },
          {
            id: 4,
            name: 'Cobertura',
            icon: CoverageIcon,
            link: '/employees/departments_staff'
          }
        ]
      },
      {
        id: 4,
        name: 'Disponibilizador',
        menu: [
          {
            id: 1,
            name: 'Disponibilizador de turnos',
            icon: MakeAvailableIcon,
            link: '/staff_requests/new'
          },
          {
            id: 2,
            name: 'Solicitudes realizadas',
            icon: RequestIcon,
            link: '/staff_requests'
          },
        ]
      },
      {
        id: 5,
        name: 'Administración',
        menu: [
          {
            id: 1,
            name: 'Tiendas',
            icon: StoresIcon,
            link: '/stores/'
          },
          {
            id: 2,
            name: 'Departamentos',
            icon: DepartmentsIcon,
            link: '/departments/'
          },
          {
            id: 3,
            name: 'Turnos',
            icon: ShiftsIcon,
            link: '/available_shifts/'
          },
          {
            id: 4,
            name: 'Usuarios',
            icon: UsersIcon,
            link: '/users/'
          },
          {
            id: 5,
            name: 'Plan de ventas',
            icon: SalesPlanIcon,
            link: '/sale_plans/'
          },
          {
            id: 8,
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
                  <a className={this.props.active == li.link ? 'active' : ''} href={li.link}>
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