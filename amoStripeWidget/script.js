define(['jquery', 'underscore'], function($, _) {
    var CustomWidget = function () {
    	var self = this;
		var langs = self.langs;
		

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
                var styleHtml = `
					<style>
						.alfa_stripe_widget-table {
							border-collapse: collapse;
							width: 100%;
						}

						.alfa_stripe_widget-table th, .alfa_stripe_widget-table td {
							border: 1px solid #ddd;
							padding: 8px;
							text-align: left;
						}

						.alfa_stripe_widget-table th {
							background-color: #3498db;
							color: #fff;
						}
					</style>`;

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
							translatedStatusStripe = langs.lcard.succeed;
						}
						else{
							translatedStatusStripe = langs.lcard.waiting;
						}

						if (payment.status_alfa == 'succeed'){
							translatedStatusAlfa = langs.lcard.succeed;
						}
						else{
							translatedStatusAlfa = langs.lcard.waiting;
						}
			
						var formattedAmount = (payment.amount === null) ? langs.lcard.nondata : payment.amount;
			
						tableHtml += '<tr>' +
							'<td>' + payment.payment_no + '</td>' +
							'<td>' + formattedDate + '</td>' +
							'<td>' + translatedStatusStripe + '</td>' +
							'<td>' + translatedStatusAlfa + '</td>' +
							'<td>' + formattedAmount + '</td>' +
							'</tr>';
					});

				tableHtml += '</tbody></table>';

				widget_tab.html(styleHtml + tableHtml);
            }
			else{
				var messageHtml = '<div style="text-align: center; font-size: 18px;">Нет данных по оплате</div>';
        		widget_tab.html(messageHtml);
			}
        }

		function renderTable(data, mainBlock, paidOnlyCheckBoxStatus = 0, addedOnlyCheckboxStatus = 0) {
			mainBlock.html("");
			var styleHtml = `<style>

			.alfaamo_stripe_users_payment_report{
				background: white;
				padding: 20px;
			}
			.alfaamo_stripe_users_payment_report table {
				border-collapse: collapse;
				width: 100%;
				margin-top:20px;
				margin-bottom: 20px;
			}
		
			.alfaamo_stripe_users_payment_report table,
			.alfaamo_stripe_users_payment_report th,
			.alfaamo_stripe_users_payment_report td {
				border: 1px solid #808080; /* Gray borders */
			}
		
			.alfaamo_stripe_users_payment_report th,
			.alfaamo_stripe_users_payment_report td {
				padding: 10px;
				text-align: left;
				font-size: 16px;
				color: black;
			}
		
			.alfaamo_stripe_users_payment_report th {
				background-color: transparent;
			}
		
			.alfaamo_stripe_users_payment_report .pagination {
				display: flex;
				list-style: none;
				padding: 0;
			}
		
			.alfaamo_stripe_users_payment_report .pagination li {
				margin-right: 5px;
				cursor: pointer;
				color: black;
			}
		
			.alfaamo_stripe_users_payment_report .checkbox-filter {
				margin-right: 15px; 
			}
		
			.alfaamo_stripe_users_payment_report label {
				color: black;
				margin-right: 20px;
				position: relative;
			}

			.alfaamo_stripe_users_payment_report .checkbox-filter{
				margin-left:10px;
			}

			.alfaamo_stripe_users_payment_report a {
				color: #1579d2; 
			}
		</style>
		`
			
			$('body').prepend(styleHtml);

			const tableContainer = $('<div id="table-container"></div>');
			mainBlock.append(tableContainer);

			const table = $('<table id="payment-table"></table>');
			tableContainer.append(table);

			const paginationContainer = $('<ul class="pagination" id="pagination"></ul>');
			tableContainer.append(paginationContainer);

			const itemsPerPage = 10;
			var paidOnlyCheckbox;
			if (paidOnlyCheckBoxStatus == 1){
				paidOnlyCheckbox = $('<input type="checkbox" class="checkbox-filter" checked>');
			}
			else{
				paidOnlyCheckbox = $('<input type="checkbox" class="checkbox-filter">');
			}
			paidOnlyCheckbox.change(() => filterTable(data));

			var addedOnlyCheckbox;
			if (paidOnlyCheckBoxStatus == 1){
				addedOnlyCheckbox = $('<input type="checkbox" class="checkbox-filter" checked>');
			}
			else{
				addedOnlyCheckbox = $('<input type="checkbox" class="checkbox-filter">');
			}
			addedOnlyCheckbox.change(() => filterTable(data));

			const filterLabelPaidOnly = $('<label>Paid Only</label>').append(paidOnlyCheckbox);
			const filterLabelAddedOnly = $('<label>Added Only</label>').append(addedOnlyCheckbox);

			mainBlock.prepend(filterLabelPaidOnly, filterLabelAddedOnly);

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

					row.append(`<td>${rowNum}</td><td>${leadLink.outerHTML}</td><td>${formatDate(paginatedData[i].payment_date)}</td><td><input type="checkbox" ${paginatedData[i].status_stripe === 'succeed' ? 'checked' : ''} disabled></td><td><input type="checkbox" ${paginatedData[i].status_alfa === 'succeed' ? 'checked' : ''} disabled></td>`);
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
			const paidOnlyCheckbox = $('.checkbox-filter:nth-child(1)');
			const addedOnlyCheckbox = $('.checkbox-filter:nth-child(2)');
	
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
					$(`#list_page_holder`).addClass('alfaamo_stripe_users_payment_report');
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