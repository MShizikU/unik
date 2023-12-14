define(['jquery', 'underscore'], function($, _) {
    var CustomWidget = function () {
    	var self = this;
		var langs = self.langs;
		var usersPaymentData;

		function fetchDataFromDatabase(amoDomain, amoId) {
            var apiUrl = 'https://alfa-amo.ru/stripe_widget/customer_payment_calendar.php';
            var queryParams = {
                amo_domain: amoDomain,
                amo_id: amoId
            };
            return $.ajax({
                url: apiUrl,
                method: 'GET',
                data: queryParams,
                dataType: 'json',
            });
        }

		function updateLeadView(data, widget_tab) {
			var langs = self.langs;
            if (data != null) {

				var tableHtml = '<table class="alfa_stripe_widget-table">' +
					'<thead>' +
					'<tr>' +
					`<th>${langs.lcard.paymentNo}</th>` +
					`<th>${langs.lcard.paymentDate}</th>` +
					`<th>${langs.lcard.statusStripe}</th>` +
					`<th>${langs.lcard.statusAlfa}</th>` +
					`<th>${langs.lcard.amount}</th>` +
					'</tr>' +
					'</thead>' +
					'<tbody>';

					$.each(data, function (index, payment) {
						var formattedDate = (payment.payment_date === "0000-00-00") ? langs.lcard.nondata : payment.payment_date;
			
						if (payment.status_stripe == 'succeed'){
							translatedStatusStripe = "checked";
						}
						else{
							translatedStatusStripe = "";
						}

						if (payment.status_alfa == 'succeed'){
							translatedStatusAlfa = "checked";
						}
						else{
							translatedStatusAlfa = "";
						}
			
						var formattedAmount = (payment.amount === null) ? langs.lcard.nondata : payment.amount;
			
						var stripeCheckbox = '<div>' + 
												'<input type="checkbox" class="custom-checkbox" id="alfaamo_stripe_widget_table_stripe_checkbox_' + index +'" name="alfaamo_stripe_widget_table_stripe_checkbox_' + index +'"' + translatedStatusStripe +  'disabled>' +
												'<label for="alfaamo_stripe_widget_table_stripe_checkbox_' + index +'"></label>' +
					  						'</div>'

						var alfaCheckbox = '<div>' + 
												'<input type="checkbox" class="custom-checkbox" id="alfaamo_stripe_widget_table_alfa_checkbox_' + index +'" name="alfaamo_stripe_widget_table_alfa_checkbox_' + index +'"' + translatedStatusAlfa +  'disabled>' +
												'<label for="alfaamo_stripe_widget_table_alfa_checkbox_' + index +'"></label>' +
											'</div>'

						tableHtml += '<tr>' +
							'<td>' + payment.payment_no + '</td>' +
							'<td>' + formattedDate + '</td>' +
							'<td>' + stripeCheckbox + '</td>' +
							'<td>' + alfaCheckbox + '</td>' +
							'<td>' + formattedAmount + '</td>' +
							'</tr>';
					});

				tableHtml += '</tbody></table>';

				widget_tab.html(tableHtml);
            }
			else{
				var messageHtml = '<div style="text-align: center; font-size: 18px;">Нет данных по оплате</div>';
        		widget_tab.html(messageHtml);
			}
        }

		function renderTable(data, mainBlock, paidOnlyCheckBoxStatus = 0, addedOnlyCheckboxStatus = 0) {
			mainBlock.html("");

			const tableContainer = $('<div id="table-container"></div>');
			mainBlock.append(tableContainer);

			const table = $('<table id="payment-table" class = "alfaamo_stripe_widget-table"></table>');
			tableContainer.append(table);

			const paginationContainer = $('<ul class="pagination" id="pagination"></ul>');
			tableContainer.append(paginationContainer);

			const itemsPerPage = 10;
			var paidOnlyDiv = $('<div></div>');
			var addedOnlyDiv = $('<div></div>');
			var paidOnlyCheckbox;
			if (paidOnlyCheckBoxStatus == 1) {
				paidOnlyCheckbox = $('<input type="checkbox" id = "alfaamo_stripe_widget_paid_only_checkbox" class="custom-checkbox checkbox-filter" checked>');
			} else {
				paidOnlyCheckbox = $('<input type="checkbox" id = "alfaamo_stripe_widget_paid_only_checkbox" class="custom-checkbox checkbox-filter">');
			}
			paidOnlyCheckbox.change(() => {
				filterTable(usersPaymentData)});

			var addedOnlyCheckbox;
			if (addedOnlyCheckboxStatus == 1) {
				addedOnlyCheckbox = $('<input type="checkbox" id = "alfaamo_stripe_widget_added_only_checkbox" class="custom-checkbox checkbox-filter" checked>');
			} else {
				addedOnlyCheckbox = $('<input type="checkbox" id = "alfaamo_stripe_widget_added_only_checkbox" class="custom-checkbox checkbox-filter">');
			}
			addedOnlyCheckbox.change(() => 
			{
				filterTable(usersPaymentData)
			});

			const filterLabelPaidOnly = $('<label for="alfaamo_stripe_widget_paid_only_checkbox">Paid Only</label>');
			const filterLabelAddedOnly = $('<label for="alfaamo_stripe_widget_added_only_checkbox">Added Only</label>');

			paidOnlyDiv.append(paidOnlyCheckbox);
			paidOnlyDiv.append(filterLabelPaidOnly);
			addedOnlyDiv.append(addedOnlyCheckbox);
			addedOnlyDiv.append(filterLabelAddedOnly);

			var filterContainer = $('<div class = "alfaamo_stripe_widget-filter-container"></div>');
			filterContainer.prepend(paidOnlyDiv, addedOnlyDiv);
			mainBlock.prepend(filterContainer);

			const headerRow = $('<tr><th>Row Num</th><th>Lead Name</th><th>Date of Payment</th><th>Stripe Status</th><th>Alfa Status</th></tr>');
			table.append(headerRow);

			const totalPages = Math.ceil(data.length / itemsPerPage);
			const pagesToShow = 3;
			var currentPage = 1;

			function populateTable(pageNumber) {
				table.html('');
				table.append(headerRow);
				const start = (pageNumber - 1) * itemsPerPage;
				const end = start + itemsPerPage;
				const paginatedData = data.slice(start, end);
				
				for (let i = 0; i < paginatedData.length; i++) {
					var row = $('<tr></tr>');
					const rowNum = start + i + 1;
					const leadLink = document.createElement('a');
					leadLink.href = `https://4124.amocrm.ru/leads/detail/${paginatedData[i].lead_id}`;
					leadLink.textContent = paginatedData[i].lead_name;

					row.append(`<td>${rowNum}</td>
								<td>${leadLink.outerHTML}</td>
								<td>${formatDate(paginatedData[i].payment_date)}</td>
								<td>
									<div>
										<input type="checkbox" class="custom-checkbox" id="alfaamo_stripe_widget_table_stripe_checkbox_${i}" name="alfaamo_stripe_widget_table_stripe_checkbox_${i}" ${paginatedData[i].status_stripe === 'succeed' ? 'checked' : ''} disabled>
										<label for="alfaamo_stripe_widget_table_stripe_checkbox_${i}"></label>
									</div>
								</td>
								<td>
									<div>
										<input type="checkbox" class="custom-checkbox" id="alfaamo_alfa_widget_table_stripe_checkbox_${i}" name="alfaamo_stripe_widget_table_alfa_checkbox_${i}" ${paginatedData[i].status_alfa === 'succeed' ? 'checked' : ''} disabled>
										<label for="alfaamo_stripe_widget_table_alfa_checkbox_${i}"></label>
									</div>
								</td>`);
					table.append(row);
				}
				currentPage = 1;
				renderPagination();
			}

			function renderPagination() {
				paginationContainer.empty();
			
				for (let i = currentPage - 1; i <= currentPage + 1; i++) {
					let pageButton;
			
					if (i <= 0 || i > totalPages) {
						continue; 
					}
			
					if (totalPages <= 3 || i <= pagesToShow || i > totalPages - pagesToShow) {
						pageButton = $('<li>' + i + '</li>');
					} else if (i === pagesToShow + 1) {
						pageButton = $('<li>Next</li>');
						pageButton.on('click', () => populateTable(currentPage + 1));
					} else if (i === totalPages - pagesToShow) {
						pageButton = $('<li>Back</li>');
						pageButton.on('click', () => populateTable(currentPage - 1));
					} else {
						continue;
					}
			
					pageButton.on('click', () => populateTable(i));
					paginationContainer.append(pageButton);
				}
			}
			populateTable(1);

		}

		function formatDate(dateString) {
			if (dateString != "0000-00-00"){
				return dateString;
			}
			else{
				return "N/A";
			}
		}

		function filterTable(data) {
			const paidOnlyCheckbox = $('.checkbox-filter').eq(0);
			const addedOnlyCheckbox = $('.checkbox-filter').eq(1);
			console.log(paidOnlyCheckbox.prop('checked'));
			console.log(addedOnlyCheckbox.prop('checked'));
			const filteredData = data.filter(row => {
				if (paidOnlyCheckbox.prop('checked') && row.status_stripe !== 'succeed') {
					return false;
				}
	
				if (addedOnlyCheckbox.prop('checked') && row.status_alfa !== 'succeed') {
					return false;
				}
	
				return true;
			});
	
			renderTable(filteredData, $(`#list_page_holder`), paidOnlyCheckbox.prop('checked') ? 1 : 0, addedOnlyCheckbox.prop('checked') ? 1 : 0);
		}

		this.callbacks = {
			render: function(){
				var w_code = self.get_settings().widget_code;
				//$(`head`).append('<link type="text/css" rel="stylesheet" href="/widgets/' + w_code + '/style.css" >');
				$(`head`).append(`<style>.alfaamo_stripe_widget{
					background: white;
					padding: 20px;
				}
				
				.alfaamo_stripe_widget-filter-container{
					display: flex;
					flex-direction: row;
				}
				.alfaamo_stripe_widget-table {
					border-collapse: collapse;
					width: 100%;
					table-layout: auto;
					z-index: 2100;
					margin: 0px 0px;
				}
				
				.alfaamo_stripe_widget-table th,
				.alfaamo_stripe_widget-table td{
					position: relative;
					z-index: 2300;
				}
				.alfaamo_stripe_widget-table tbody{
					z-index: 2200;
				}
				
				.alfaamo_stripe_widget-table thead tr::before{
					z-index: 2300 !important;
				}
				
				.alfaamo_stripe_widget-table tr::before{
					top: 0;
					bottom: 0;
					border-color: var(--disabled-block);
					border-style: solid;
					border-width: 0px 0px 1px 0px;
					background-color: transparent;
					z-index: 2300;
					transition: .3s all;
				}
				
				.tbody_wrapper{
					display: table;
					width: 100%;
				}
				
				.alfaamo_stripe_widget-table thead tr th{
					position: sticky;
					top: 0;
					vertical-align: top;
				}
				
				.alfaamo_stripe_widget-table thead tr,
				.alfaamo_stripe_widget-table tbody tr {
					width: 100%;
					table-layout: fixed;
					text-align: left;
				}
				
				
				.alfaamo_stripe_widget-table th {
					background: linear-gradient(to bottom, rgba(255, 255, 255, 1) 85%, rgba(255, 255, 255, 0) 100%);
					text-align: left;
					color: var(--text-selector);
					font-feature-settings: 'clig' off, 'liga' off;
					font-family: Inter;
					font-size: 16px;
					font-style: normal;
					font-weight: 600;
					line-height: 1;
					padding-right: 16px;
					padding-right: 16px;
					padding-top:8px;
					padding-bottom:7px;
					z-index: 2350;
				}
				
				.alfaamo_stripe_widget-table th:last-child{
					padding-right: 0px;
				}
				
				.alfaamo_stripe_widget-table th:first-child{
					padding-left: 0px;
				}
				
				.alfaamo_stripe_widget-table tr td{    
					background-color: transparent;
					vertical-align:top;
					color: var(--table-text);
					font-feature-settings: 'clig' off, 'liga' off;
					font-family: Inter;
					font-size: 16px;
					font-style: normal;
					font-weight: 400;
					line-height: 1;
					padding-right: 16px;
					padding-top:8px;
					padding-bottom:7px;
					height: 10px;
					text-wrap: balance;
				}
				.alfaamo_stripe_widget-table td:last-child {
					padding-right:16px;
				}
				
				.alfaamo_stripe_widget-table td:first-child{
					padding-left: 0px;
					padding-right: 6px;
				}
				
				.alfaamo_stripe_widget .pagination {
					display: flex;
					list-style: none;
					padding: 0;
					margin-top: 10px;
				}
				
				.alfaamo_stripe_widget .pagination li {
					margin-right: 5px;
					cursor: pointer;
					color: #1579d2;
				}
				
				.alfaamo_stripe_widget .checkbox-filter {
					margin-right: 15px; 
				}
				
				.alfaamo_stripe_widget label {
					color: black;
					margin-right: 20px;
					position: relative;
				}
				
				.alfaamo_stripe_widget .checkbox-filter{
					margin-left:10px;
				}
				
				.alfaamo_stripe_widget a {
					color: #1579d2; 
				}
				
				.alfaamo_stripe_widget .custom-checkbox + label {
					cursor: pointer;
					display: inline-flex;
					align-items: center;
					user-select: none;
					color: var(--01, #101F23);
					font-feature-settings: "clig" 0, "liga" 0;
					font-family: Inter;
					font-size: 14px;
					font-style: normal;
					font-weight: 400;
					line-height: 100%;
				}
				
				.alfaamo_stripe_widget .custom-checkbox {
					cursor: pointer;
					position: absolute;
					z-index: -1;
					opacity: 0;
				}
				
				.alfaamo_stripe_widget .custom-checkbox + label::before {
					cursor: pointer;
					content: "";
					display: inline-block;
					flex-shrink: 0;
					flex-grow: 0;
					width: 14px;
					height: 14px;
					margin-right: 5px;
					background-size: 50% 50%;
					border: 1px solid #9AA8AB;
					background-repeat: no-repeat;
					background-position: center center;
				}
				
				.alfaamo_stripe_widget .custom-checkbox:checked + label::before {
					background-color: rgba(94, 207, 255, 0.5);
					background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8' viewBox='0 0 8 8' fill='none'%3E%3Cpath d='M6.8141 1.08814C6.89222 1.00752 7.02138 1.00697 7.10018 1.08693L7.86256 1.86053C7.93894 1.93802 7.93935 2.06235 7.86349 2.14035L3.27966 6.85369C3.20156 6.93401 3.07272 6.93451 2.99399 6.8548L0.13866 3.9639C0.0617797 3.88606 0.0617102 3.7609 0.138504 3.68297L0.901265 2.909C0.979508 2.8296 1.10756 2.8295 1.18593 2.90876L3.13739 4.88234L6.8141 1.08814Z' fill='%233168CA'/%3E%3C/svg%3E");
					border-color: #233DB9;
				}
				</style>`)
                return true;
			},
			destroy: function(){

			},
			init: function(){
				return true;
			},
			bind_actions: function(){
				return true;
			},
			onSave: function() {
				return true;
			},
			settings: function () {
				$('.js-widget-save').trigger('button:save:enable');
				return true;
			},
			advancedSettings: function () {
				fetch('https://alfa-amo.ru/stripe_widget/user_payment_calendars.php?amo_domain=' + AMOCRM.widgets.system.domain)
				.then(response => response.json())
				.then(data => {
					usersPaymentData = data;
					$(`#list_page_holder`).addClass('alfaamo_stripe_widget');
					renderTable(data, $(`#list_page_holder`));
				})
				.catch(error => console.error('Error fetching data:', error));

			},
			/**
			 * @description метод, вызов которого происходит при инициализации, должен вернуть массив объектов элементов, которые покажутся при фокусе на поле поиска
			 * @returns {Promise}
			 */
			loadPreloadedData: function () {
				var amoDomain = AMOCRM.widgets.system.domain;
				var amoId = AMOCRM.data.current_card.id;

				let widget_code = self.get_settings().widget_code;
				$(`.card-tabs__item[data-id="${widget_code}"] span`).text('Платежи');

				var widget_tab = $('#' + widget_code);
				widget_tab.addClass("alfaamo_stripe_widget");
				widget_tab.css({
					'position': 'absolute',
					'top': '0',
					'left': '0',
					'right': '0',
					'bottom': '0',
					'overflow-y': 'auto'
				});

				fetchDataFromDatabase(amoDomain, amoId).then(function (data) {
					updateLeadView(data, widget_tab);
				});
				return Promise.resolve({});
			},

			/**
			 * @param type - тип сущности, из которой делается запрос
			 * @param id - id сущности из которой делается запрос
			 * @description метод, вызов которого происходит при инициализации, должен вернуть массив объектов элементов, которые привязаны к карточке
			 * @returns {Promise}
			 */
			loadElements: function (type, id) {
				return Promise.resolve({});
			},

			/**
			 * @param links - массив данных о привязке или отвязке элементов от сущности
			 * @description метод, вызов которого происходит при сохранении привязки или отвязке сущности от карточки
			 * @returns {Promise}
			 */
			linkCard: function (links) {
				return Promise.resolve({});
			},

			/**
			 * @param query - запрос, который делается на поиск
			 * @param {Number} type - тип сущности, из которой делается запрос
			 * @param {Number} id - id сущности из которой делается запрос
			 * @description метод, вызов которого происходит при поиске карточки
			 * @returns {Promise}
			 */
			searchDataInCard: function (query, type, id) {
				return Promise.resolve({});
			}
		};
		return this;
    };

return CustomWidget;
});