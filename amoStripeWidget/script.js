define(['jquery', 'underscore'], function($, _) {
    var CustomWidget = function () {
    	var self = this;
		var usersPaymentData;
		var filterCalendar;
		var filterCalendarView;
		

		this.callbacks = {
			render: function(){
				var w_code = self.get_settings().widget_code;
				//$(`head`).append('<link type="text/css" rel="stylesheet" href="/widgets/' + w_code + '/style.css" >');
				$(`head`).append(getStyles())
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
				$(`head`).append(getStyles())
				var amoDomain = AMOCRM.widgets.system.domain;
				var amoId = AMOCRM.data.current_card.id;

				let widget_code = self.get_settings().widget_code;

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

				var tableHtml = '<table class="alfaamo_stripe_widget-table" style="margin-left: 20px">' +
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
												'<input type="checkbox" class="custom-checkbox" id="alfaamo_stripe_widget_table_stripe_checkbox_' + index +'" name="alfaamo_stripe_widget_table_stripe_checkbox_' + index +'"' + translatedStatusStripe +  ' disabled>' +
												'<label for="alfaamo_stripe_widget_table_stripe_checkbox_' + index +'"></label>' +
											'</div>'

						var alfaCheckbox = '<div>' + 
												'<input type="checkbox" class="custom-checkbox" id="alfaamo_stripe_widget_table_alfa_checkbox_' + index +'" name="alfaamo_stripe_widget_table_alfa_checkbox_' + index +'"' + translatedStatusAlfa +  ' disabled>' +
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

		function renderTable(data, mainBlock, isGenerated = false) {
			var tableContainer;
			var itemsPerPage = 10;
			if (isGenerated){
				tableContainer = $("#table-container");
				tableContainer.html("");
			}
			else{
				mainBlock.html("");
	
				var paidOnlyDiv = $('<div></div>');
				var addedOnlyDiv = $('<div></div>');
				var paidOnlyCheckbox = $('<input type="checkbox" id = "alfaamo_stripe_widget_paid_only_checkbox" class="custom-checkbox checkbox-filter">');
				
				paidOnlyCheckbox.change(() => {
					filterTable(usersPaymentData)});
	
				var addedOnlyCheckbox = $('<input type="checkbox" id = "alfaamo_stripe_widget_added_only_checkbox" class="custom-checkbox checkbox-filter">');
				
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
				generateCalendar("alfaamo_payment_report_calendar", "Даты платежей", filterContainer);
				filterContainer.prepend(paidOnlyDiv, addedOnlyDiv);
				mainBlock.prepend(filterContainer);
				inputMasksEventListner();
				filterCalendar = new CustomCalendar(document.querySelector("#alfaamo_payment_report_calendar"), (cal) => filterTable(usersPaymentData), (cal) => filterTable(usersPaymentData));
				tableContainer = $('<div id="table-container"></div>');
				mainBlock.append(tableContainer);
			}
			

			const table = $('<table id="payment-table" class = "alfaamo_stripe_widget-table"></table>');
			tableContainer.append(table);

			const paginationContainer = $('<ul class="pagination" id="pagination"></ul>');
			tableContainer.append(paginationContainer);
			
			
			const headerRow = $(`<tr><th>№</th><th>${self.langs.advanced.paymentNo}</th><th>${self.langs.advanced.leadName}</th><th>${self.langs.advanced.paymentDate}</th><th>${self.langs.advanced.statusStripe}</th><th>${self.langs.advanced.statusAlfa}</th><th>${self.langs.advanced.amount}</th></tr>`);
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
								<td>${paginatedData[i].payment_no}</td>
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
								</td>
								<td>${paginatedData[i].amount ? paginatedData[i].amount : self.langs.advanced.nondata}<td>`);
					table.append(row);
				}
				currentPage = pageNumber;
				renderPagination();
			}

			function renderPagination() {
				paginationContainer.empty();
			
				if (totalPages === 0 ) return;

				if (totalPages <= 3) {
					for (let i = 1; i <= totalPages; i++) {
						const pageButton = $('<li>' + i + '</li>');
						pageButton.on('click', () => populateTable(i));
						paginationContainer.append(pageButton);
					}
				} else {
					const pageButtonStart = $('<li>«</li>');
					const pageButtonPrev = $('<li>Prev</li>');
					const pageButtonNext = $('<li>Next</li>');
					const pageButtonEnd = $('<li>»</li>');
		
					if (currentPage > 1) {
						pageButtonStart.on('click', () => populateTable(1));
						paginationContainer.append(pageButtonStart);
					}

					if (currentPage - 1 > 1){
						pageButtonPrev.on('click', () => populateTable(currentPage - 2));
						paginationContainer.append(pageButtonPrev);
					}

					for (let i = currentPage - 1; i <= currentPage + 1; i++) {
						if (i >= 1 && i <= totalPages) {
							const pageButton = $('<li>' + i + '</li>');
							pageButton.on('click', () => populateTable(i));
							paginationContainer.append(pageButton);
						}
					}

					if (currentPage == 1 && totalPages >= 3){
						const pageButton = $('<li>' + 3 + '</li>');
						pageButton.on('click', () => populateTable(3));
						paginationContainer.append(pageButton);
					}

					if (currentPage + 1 < totalPages){
						pageButtonNext.on('click', () => populateTable(currentPage + 1));
						paginationContainer.append(pageButtonNext);
					}

					if (currentPage < totalPages) {
						pageButtonEnd.on('click', () => populateTable(totalPages));
						paginationContainer.append(pageButtonEnd);
					}

				}
			}
			populateTable(1);

		}

		function generateCalendar(id, name, parent){
			console.log(self);
			var calendarWrapper = $("<div>").addClass("calendar-wrapper").attr("id", id);
			const datePicker = $("<div>").addClass("date_picker");
			const dateInput = $("<div>").addClass("date_picker_input");
			const label = $("<label>").text(name);
		
			const inputBlock = $("<div>").addClass("cal_input_block");
			const inputIcon = $("<div>").addClass("cal_input_icon");
		
			const svgCalendar = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
			svgCalendar.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
			svgCalendar.setAttribute('width', '14');
			svgCalendar.setAttribute('height', '14');
			svgCalendar.setAttribute('viewbox', '0 0 14 14');
			svgCalendar.setAttribute('fill', 'none');
		
			const pathCalendar = document.createElementNS('http://www.w3.org/2000/svg', 'path');
			pathCalendar.setAttribute('fill-rule', 'evenodd');
			pathCalendar.setAttribute('clip-rule', 'evenodd');
			pathCalendar.setAttribute('d', 'M2.25667 1.74459V0H3.9481V1.74459H10.0517V0H11.7431V1.74459H12.1105C13.7255 1.74459 13.9791 2.03447 14 3.45121V12.2503C14 13.489 13.8885 14 12.3656 14H1.64392C0.121022 14 0 13.6287 0 12.1248V3.62268C0.0204458 2.42723 0.136099 1.74459 1.7507 1.74459L2.25667 1.74459ZM1.35359 11.8814C1.35359 12.3546 1.4963 12.3861 1.80608 12.3861H12.2508C12.5602 12.3861 12.6469 12.3787 12.6469 11.9047V4.80285C12.6382 4.43703 12.5197 4.37272 12.2791 4.37272H1.69559C1.45479 4.37272 1.35029 4.42559 1.35359 4.7071L1.35359 11.8814Z');
			pathCalendar.setAttribute('fill', '#AFBCBE');
		
			svgCalendar.append(pathCalendar);
			inputIcon.append(svgCalendar);
		
			const inputFirst = $("<input>").attr({
				"type": "text",
				"class": "cal_date_input first",
				"id": id + "_first_input",
				"placeholder": self.langs.utils.calendar.CAL_FROM + '__.__.____',
				"data-slots": ""
			});
		
			const inputSecond = $("<input>").attr({
				"type": "text",
				"class": "cal_date_input second",
				"id": id + "_second_input",
				"placeholder": self.langs.utils.calendar.CAL_TO + '__.__.____',
				"data-slots": ""
			});
		
			const clearIcon = $("<div>").addClass("cal_input_clear");
			const svgClear = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
			svgClear.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
			svgClear.setAttribute('width', '14');
			svgClear.setAttribute('height', '14');
			svgClear.setAttribute('viewbox', '0 0 14 14');
			svgClear.setAttribute('fill', 'none');
		
			const pathClear = document.createElementNS('http://www.w3.org/2000/svg', 'path');
			pathClear.setAttribute('d', 'M12.8337 2.34175L11.6587 1.16675L7.00033 5.82508L2.34199 1.16675L1.16699 2.34175L5.82533 7.00008L1.16699 11.6584L2.34199 12.8334L7.00033 8.17508L11.6587 12.8334L12.8337 11.6584L8.17533 7.00008L12.8337 2.34175Z');
			pathClear.setAttribute('fill', '#AFBCBE');
		
			svgClear.append(pathClear);
			clearIcon.append(svgClear);
		
			inputBlock.append(inputIcon, inputFirst, inputSecond, clearIcon);
			dateInput.append(label, inputBlock);
		
			const calendarHidden = $("<div>").addClass("date_picker_calendar hidden");
		
			const calendarHeader = $("<div>").addClass("calendar_header");
		
			const backBtn = $("<button>").addClass("cal-btn back");
			const svgBack = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
			svgBack.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
			svgBack.setAttribute('width', '10');
			svgBack.setAttribute('height', '11');
			svgBack.setAttribute('viewbox', '0 0 10 11');
			svgBack.setAttribute('fill', 'none');
		
			const pathBack = document.createElementNS('http://www.w3.org/2000/svg', 'path');
			pathBack.setAttribute('d', 'M1.90039 5.5L7.30039 0.303848L7.30039 10.6962L1.90039 5.5Z');
			pathBack.setAttribute('fill', '#AFBCBE');
		
			svgBack.append(pathBack);
			backBtn.append(svgBack);
		
			const span = $("<span>");
		
			const frontBtn = $("<button>").addClass("cal-btn front");
			const svgFront = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
			svgFront.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
			svgFront.setAttribute('width', '10');
			svgFront.setAttribute('height', '11');
			svgFront.setAttribute('viewbox', '0 0 10 11');
			svgFront.setAttribute('fill', 'none');
		
			const pathFront = document.createElementNS('http://www.w3.org/2000/svg', 'path');
			pathFront.setAttribute('d', 'M8.59961 5.5L3.19961 10.6962L3.19961 0.303848L8.59961 5.5Z');
			pathFront.setAttribute('fill', '#AFBCBE');
		
			svgFront.append(pathFront);
			frontBtn.append(svgFront);
		
			calendarHeader.append(backBtn, span, frontBtn);
		
			const calWrapper = $("<div>").addClass("cal_wrapper");
			const calDays = $("<div>").addClass("cal_days");
			const calendarMain = $("<div>").addClass("calendar_main");
		
			calWrapper.append(calDays, calendarMain);
		
			calendarHidden.append(calendarHeader, calWrapper);
		
			datePicker.append(dateInput, calendarHidden);
		
			calendarWrapper.append(datePicker);
		
			parent.append(calendarWrapper);
		}

		function formatDate(dateString) {
			if (dateString != "0000-00-00"){
				return dateString;
			}
			else{
				return self.langs.advanced.nondata;
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

				if (filterCalendar.firstSelectedDay === null && filterCalendar.secondSelectedDay === null){
					return true;
				}

				const startDate = filterCalendar.firstSelectedDay ? new Date(filterCalendar.firstSelectedDay) : null;
				const endDate = filterCalendar.secondSelectedDay ? new Date(filterCalendar.secondSelectedDay) : null;

				if (row.paymentDate === null){
					return false;
				}

				const dateToCheck = new Date(row.payment_date + "T00:00:00");



				if (startDate === null){
					return dateToCheck <= endDate;
				}
				else if (endDate === null){
					return dateToCheck >= startDate;
				}
				else{
					return dateToCheck >= startDate && dateToCheck <= endDate;
				}
			});

			renderTable(filteredData, $(`#list_page_holder`), true);
		}

		function inputMasksEventListner(){
			for (const el of document.querySelectorAll("[placeholder][data-slots]")) {
				const pattern = el.getAttribute("placeholder"),
					slots = new Set(el.dataset.slots || "_"),
					prev = (j => Array.from(pattern, (c,i) => slots.has(c)? j=i+1: j))(0),
					first = [...pattern].findIndex(c => slots.has(c)),
					accept = new RegExp(el.dataset.accept || "\\d", "g"),
					clean = input => {
						input = input.match(accept) || [];
						return Array.from(pattern, c =>
							input[0] === c || slots.has(c) ? input.shift() || c : c
						);
					},
					format = () => {
						const [i, j] = [el.selectionStart, el.selectionEnd].map(i => {
							i = clean(el.value.slice(0, i)).findIndex(c => slots.has(c));
							return i<0? prev[prev.length-1]: back? prev[i-1] || first: i;
						});
						el.value = clean(el.value).join``;
						el.setSelectionRange(i, j);
						back = false;
					};
				let back = false;
				el.addEventListener("keydown", (e) => back = e.key === "Backspace");
				el.addEventListener("input", format);
				el.addEventListener("focus", format);
				el.addEventListener("blur", () => el.value === pattern && (el.value=""));
			}
		}


		function getStyles(){
			return `<style>.alfaamo_stripe_widget{
				background: white;
				padding: 20px;
			}
			
			.alfaamo_stripe_widget-filter-container{
				display: flex;
				flex-direction: column;
				gap: 10px;
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
			
			.alfaamo_stripe_widget .calendar-wrapper {
				height: fit-content;
				background: var(--dark-body-bg);
				box-sizing: content-box;
			}
			
			.alfaamo_stripe_widget .date_picker {
				width: 260px;
				margin: 0;
				position: relative;
				top: 15%;
			}
			
			.alfaamo_stripe_widget .date_picker_input {
				display: flex;
				flex-direction: column;
				gap: 10px;
				margin-bottom: 8px;
			}
			
			.alfaamo_stripe_widget .date_picker_input label {
				color: var(--text-black);
				font-feature-settings: 'clig' off, 'liga' off;
				font-family: Inter;
				font-size: 14px;
				font-style: normal;
				font-weight: 500;
				line-height: 100%;
			}
			
			.alfaamo_stripe_widget .cal_input_block {
				width: 260px;
				display: flex;
				flex-direction: row;
				background: var(--basement);
				box-shadow: inset 0px 0px 0px 1px var(--disabled-block);
				justify-content: space-around;
			}
			
			.alfaamo_stripe_widget .cal_input_icon {
				display: flex;
				align-items: center;
				justify-content: center;
				cursor: pointer;
			}
			
			.alfaamo_stripe_widget .cal_input_clear {
				display: flex;
				align-items: center;
				justify-content: center;
				cursor: pointer;
			}
			
			.alfaamo_stripe_widget .cal_date_input {
				color: var(--text-gray);
				font-feature-settings: 'clig' off, 'liga' off;
				font-family: Inter;
				font-size: 12px;
				font-style: normal;
				font-weight: 400;
				line-height: 20px;
				outline: none;
				border: 0px;
				width: 95px;
				background-color: transparent;
			}
			
			.alfaamo_stripe_widget .cal_input_block:hover .cal_input_icon svg path {
				fill: var(--second-blue);
			}
			
			.alfaamo_stripe_widget .cal_input_block:hover .cal_date_input {
				font-weight: 600;
			}
			
			.alfaamo_stripe_widget .cal_input_block:has(.cal_date_input:focus) {
				font-weight: 600;
				background-color: var(--white);
			}
			
			.alfaamo_stripe_widget .cal_input_block:has(.cal_date_input:focus) .cal_date_input {
				font-weight: 600;
			}
			
			.alfaamo_stripe_widget .date_picker_calendar {
				min-height: fit-content;
				box-shadow: 0px 1px 10px 0px rgba(60, 161, 235, 0.25);
				overflow: hidden;
				background: var(--basement);
				padding: 16px 13px;
				position: absolute;
				z-index: 2500;
			}
			
			.alfaamo_stripe_widget .date_picker_input.showCal .cal_input_block .cal_input_icon svg path {
				fill: var(--second-blue);
			}
			
			.alfaamo_stripe_widget .cal_input_clear:hover svg path {
				fill: var(--second-blue);
			}
			
			.alfaamo_stripe_widget .date_picker_calendar.hidden {
				visibility: hidden;
			}
			
			.alfaamo_stripe_widget .calendar_header {
				width: 100%;
				min-height: 30px;
				margin-bottom: 8px;
				color: var(--text-selector);
				display: flex;
				align-items: center;
				justify-content: space-between;
				font-feature-settings: 'clig' off, 'liga' off;
				font-family: Inter;
				font-size: 14px;
				font-style: normal;
				font-weight: 500;
				line-height: 16px;
			}
			
			.alfaamo_stripe_widget .cal-btn {
				width: 20px;
				height: 20px;
				background: var(--dark-arrows-bg);
				border: none;
				padding: 0;
				margin: 0;
				border-radius: 6px;
			}
			
			.alfaamo_stripe_widget .cal-btn img {
				width: 10px;
				height: 10px;
			}
			
			.alfaamo_stripe_widget .cal-btn:hover svg path {
				fill: var(--second-blue);
			}
			
			.alfaamo_stripe_widget .cal_days,
			.alfaamo_stripe_widget .calendar_main {
				display: grid;
				grid-template-columns: repeat(7, 1fr);
				row-gap: 4px;
				column-gap: 4px;
				color: var(--text-selector);
				text-align: center;
				font-feature-settings: 'clig' off, 'liga' off;
				font-family: Inter;
				font-size: 12px;
				font-style: normal;
				font-weight: 400;
				line-height: 16px;
			}
			
			.alfaamo_stripe_widget .cal_days {
				margin-top: 13px;
				margin-bottom: 4px;
			}
			
			.alfaamo_stripe_widget .calendar_main {
				grid-template-rows: repeat(6, min(30px));
			}
			
			.alfaamo_stripe_widget .cell_wrapper {
				display: flex;
				justify-content: center;
				align-items: center;
				position: relative;
				width: 30px;
			}
			
			.alfaamo_stripe_widget .cal_days .cell_item {
				display: flex;
				text-align: center;
				align-items: center;
				justify-content: center;
				background-color: var(--white);
				height: 24px;
				width: 30px;
			}
			
			.alfaamo_stripe_widget .cal_date {
				color: var(--inactive-gray);
				background-color: var(--white);
			}
			
			.alfaamo_stripe_widget .current {
				background-color: var(--white);
				color: var(--text-selector);
			}
			
			.alfaamo_stripe_widget .current:not(.active):hover {
				background: #e1f5fe;
			}
			
			.alfaamo_stripe_widget .cal-btn:hover,
			.alfaamo_stripe_widget .current:hover {
				cursor: pointer;
			}
			
			.alfaamo_stripe_widget .active {
				background: var(--second-blue);
				color: var(--white);
			}
			
			.alfaamo_stripe_widget .isSelected {
				background: var(--second-blue);
				color: var(--white);
			}
			
			.alfaamo_stripe_widget .additional-active {
				color: var(--text-selector);
				background-color: var(--disabled-block);
			}
			
			.alfaamo_stripe_widget .inactive_indicator:after {
				content: '';
				width: 3px;
				height: 3px;
				background: red;
				border-radius: 50%;
				position: absolute;
				bottom: 3px;
				left: 50%;
			}
			</style>`;
		}


		class CustomCalendar{

			CAL_DAYS = [
				"Вс",
				"Пн",
				"Вт",
				"Ср",
				"Чт",
				"Пт",
				"Сб"
			];
			
			CAL_MONTHS = [
				"январь",
				"февраль",
				"март",
				"апрель",
				"май",
				"июнь",
				"июль",
				"август",
				"сентябрь",
				"октябрь",
				"ноябрь",
				"декабрь"
			];

			constructor(head_element, inputChangedCallBack, clearCallBack){
			this.calendar = null;
			this.firstInput = null;
			this.secondInput = null;
			this.calHeader = null;
			this.calHeaderTitle = null;
			this.calDays = null;
			this.days = [
				"Вс",
				"Пн",
				"Вт",
				"Ср",
				"Чт",
				"Пт",
				"Сб"
			];
			this.months = [
				"январь",
				"февраль",
				"март",
				"апрель",
				"май",
				"июнь",
				"июль",
				"август",
				"сентябрь",
				"октябрь",
				"ноябрь",
				"декабрь"
			];
			this.todayTimestamp = null;
			this.oneDay = 60 * 60 * 24 * 1000;
			this.selectedDay = null;
			this.inputChangedCallBack = null;
			this.clearCallBack = null;
			this.init(head_element, inputChangedCallBack, clearCallBack);
			}
			
			init(head_element, inputChangedCallBack, clearCallBack){
			this.head_element = head_element;
			this.calendar = this.head_element.querySelector(".calendar_main");
			this.firstInput = this.head_element.querySelector(".cal_date_input.first");
			this.secondInput = this.head_element.querySelector(".cal_date_input.second");
			this.calHeader = this.head_element.querySelector(".calendar_header");
			this.calHeaderTitle = this.head_element.querySelector(".calendar_header span");
			this.calDays = this.head_element.querySelector(".cal_days");
			this.clearSign = this.head_element.querySelector(".cal_input_clear");
			this.calIcon = this.head_element.querySelector(".cal_input_icon");
			this.todayTimestamp = Date.now() - (Date.now() % this.oneDay) + new Date().getTimezoneOffset() * 1000 * 60;
			this.firstSelectedDay = null;//this.todayTimestamp;
			this.secondSelectedDay = null; //this.todayTimestamp + this.oneDay * 14;
			this.date = new Date();
			this.year = this.date.getFullYear();
			this.month = this.date.getMonth();
			this.monthDetails = this.getMonthDetails(this.year, this.month);
		
			this.inputChangedCallBack = inputChangedCallBack;
			this.clearCallBack = clearCallBack;
		
			//this.setDateToInput(this.firstSelectedDay, this.firstInput);
			//this.setDateToInput(this.secondSelectedDay, this.secondInput);
			
			this.setHeader(this.year, this.month);
			this.fillCalendarDays();
			this.setCalBody();
			this.head_element.querySelectorAll(".cal-btn").forEach((btn) => {
				btn.addEventListener("click", () => {
				this.updateCalendar(btn);
				this.updateInput();
				});
			});
		
			this._setInputBehavior();
			this.updateInput();
		
			this.clearSign.addEventListener('click', () => {
				this._clearInputs();
			});
		
			this.calIcon.addEventListener('click', () => {
		
				this.head_element.querySelector('.date_picker_calendar').classList.toggle('hidden');
				
				this.head_element.querySelector('.date_picker_input').classList.toggle('showCal');
			});
		
			document.addEventListener('click', (event) => {
				if (!head_element.contains(event.target) && head_element.querySelector('.date_picker_input').classList.contains('showCal')) {
					this._closeCalendar(500);
				}
			});
			}
		
			_setInputBehavior(){
			//first input
			this.firstInput.addEventListener('click', () => {
				if (this.head_element.querySelector('.date_picker_calendar').classList.contains('hidden')){
				this.head_element.querySelector('.date_picker_calendar').classList.remove('hidden');
				}
				if (!this.head_element.querySelector('.date_picker_input').classList.contains('showCal')){
				this.head_element.querySelector('.date_picker_input').classList.add('showCal')
				}
			});
		
			this.firstInput.addEventListener('focus', () => {
				this.firstInput.classList.add('onFocus');
				this.secondInput.classList.contains('onFocus') && this.secondInput.classList.remove('onFocus');
			});
		
			this.firstInput.addEventListener('blur',() =>{
				setTimeout(() =>  {
				this.firstInput.classList.remove('onFocus');
				}, 300);
			});
		
			this.firstInput.addEventListener('input', () => {
				setTimeout(() => {
				this._changeDateFromInput(this.firstInput, true);
				if (this.inputChangedCallBack !== null){
					this.inputChangedCallBack(this);
				}
				}, 100);
			});
		
			//second Input
			this.secondInput.addEventListener('click', () => {
				if (this.head_element.querySelector('.date_picker_calendar').classList.contains('hidden')){
				this.head_element.querySelector('.date_picker_calendar').classList.remove('hidden')
				}
				if (!this.head_element.querySelector('.date_picker_input').classList.contains('showCal')){
				this.head_element.querySelector('.date_picker_input').classList.add('showCal')
				}
			});
		
			this.secondInput.addEventListener('focus', ()=>{
				this.secondInput.classList.add('onFocus');
				this.firstInput.classList.contains('onFocus') && this.firstInput.classList.remove('onFocus');
			});
			
			this.secondInput.addEventListener('blur', () =>{
				setTimeout(() => {
				this.secondInput.classList.remove('onFocus');
				}, 300);
			});
		
			this.secondInput.addEventListener('input', () => {
				setTimeout(() => {
				this._changeDateFromInput(this.secondInput, false);
				if (this.inputChangedCallBack !== null){
					this.inputChangedCallBack(this);
				}
				}, 100);
			});
			}
			
			_clearInputs(){
			this.firstSelectedDay = null;
			this.secondSelectedDay = null;
			let days = this.calendar.querySelectorAll(".cal_date");
		
			days.forEach(day => {
				day.classList.remove("isSelected");
				day.classList.remove("active");
				day.classList.remove("additional-active");
			});
		
			this.firstInput.value = "";
			this.secondInput.value = "";
			this.clearCallBack();
			}
		
			_changeDateFromInput(input, isFirst){
			if (input.value.replace(/\_/g, "").replace(/\D+/g, "").replace(/\./g, "").replace(" ", "").length === 0){
				if (isFirst){
				this.firstSelectedDay = null;
				}
				else{
				this.secondSelectedDay = null;
				}
				this.removeMiddleSelected();
				this.selectOnClick();
					this.calendar.innerHTML = "";
					this.setCalBody();
					this.updateInput();
			}
			if (input.value.replace(/\_/g, "").replace(/\D+/g, "").replace(/\./g, "").replace(" ", "").length === 8){
				let date = this._getTimeStampFromInput(input);
				if (!isNaN(date)){
				if (date.getTime() === this.firstSelectedDay){
					if (isFirst){
					input.value = self.langs.utils.calendar.CAL_FROM + this.getDateStringFromTimestamp(this.firstSelectedDay);
					}else{
					input.value = self.langs.utils.calendar.CAL_TO + this.getDateStringFromTimestamp(this.secondSelectedDay);
					}
					return;
				}else if ( date.getTime() === this.secondSelectedDay){
					if (isFirst){
					input.value = self.langs.utils.calendar.CAL_FROM + this.getDateStringFromTimestamp(this.firstSelectedDay);
					}else{
					input.value = self.langs.utils.calendar.CAL_TO + this.getDateStringFromTimestamp(this.secondSelectedDay);
					}
					return;
				}
				this.year = date.getFullYear();
				this.month = date.getMonth();
				date = date.getTime();
				this.setHeader(this.year, this.month);
				this.monthDetails = this.getMonthDetails(this.year, this.month);
				if (isFirst && (date < this.secondSelectedDay || this.secondSelectedDay === null)){
					this.firstSelectedDay = date;
				}
				else if (!isFirst && date > this.firstSelectedDay && this.firstSelectedDay !== null){
					this.secondSelectedDay = date
				}
				else if (!isFirst && ( date < this.firstSelectedDay || this.firstSelectedDay === null)){
					this.secondInput.value = self.langs.utils.calendar.CAL_TO + this.getDateStringFromTimestamp(this.firstSelectedDay);
					this.firstSelectedDay = date;
					this.firstInput.value = self.langs.utils.calendar.CAL_FROM + this.getDateStringFromTimestamp(date);
				}
				else if (isFirst && date > this.secondSelectedDay)
				{
					this.firstInput.value = self.langs.utils.calendar.CAL_FROM + this.getDateStringFromTimestamp(this.secondSelectedDay);
					this.secondSelectedDay = date;
					this.secondInput.value = self.langs.utils.calendar.CAL_TO + this.getDateStringFromTimestamp(date);
				}
				this.selectOnClick();
				this.calendar.innerHTML = "";
				this.setCalBody();
				this.updateInput();
				}
				else{
				if (isFirst){
					this.firstSelectedDay = null;
				}
				else{
					this.secondSelectedDay = null;
				}
				}
			}
			}
			
			getNumberOfDays(year, month) {
			return 40 - new Date(year, month, 40).getDate();
			}
			
			getDayDetails(args) {
			let date = args.index - args.firstDay;
			let day = args.index % 7;
			let prevMonth = args.month - 1;
			let prevYear = args.year;
			if (prevMonth < 0) {
				prevMonth = 11;
				prevYear--;
			}
			let prevMonthNumberOfDays = this.getNumberOfDays(prevYear, prevMonth);
			let _date =  (date < 0 ? prevMonthNumberOfDays + date : date % args.numberOfDays) + 1;
			let month = date < 0 ? -1 : date >= args.numberOfDays ? 1 : 0;
			let timestamp = new Date(args.year, args.month, _date).getTime();
			return {
				date: _date,
				day,
				month,
				timestamp,
				dayString: this.days[day]
			};
			}
			
			getMonthDetails(year, month) {
			let firstDay = new Date(year, month).getDay();
			let numberOfDays = this.getNumberOfDays(year, month);
			let monthArray = [];
			let rows = 5;
			this.calendar.style["grid-template-rows"] = "repeat(5, min(30px))";
			let currentDay = null;
			let index = 0;
			let cols = 7;
			if ((firstDay >= 5 && numberOfDays === 31) || (firstDay >= 6 && numberOfDays === 30)){
				rows = 6;
				this.calendar.style["grid-template-rows"] = "repeat(6, min(30px))";
			}
			for (let row = 0; row < rows; row++) {
				for (let col = 0; col < cols; col++) {
				currentDay = this.getDayDetails({
					index,
					numberOfDays,
					firstDay,
					year,
					month
				});
				monthArray.push(currentDay);
				index++;
				}
			}
			return monthArray;
			}
		
			setMiddleSelected(){
			if (this.head_element.querySelectorAll(".cal_date.isSelected").length === 2){
				let days = this.calendar.querySelectorAll(".cal_date");
				let fromChecker = false;
				days.forEach(day => {
				if (day.classList.contains("active") && !fromChecker){
					fromChecker = true;
				}else if (day.classList.contains("active") && fromChecker){
					fromChecker = false;
				}
				else if (fromChecker){
					day.classList.add("additional-active");
				}
				else{
					day.classList.remove("additional-active");
				}
				});
			}
			else if (this.head_element.querySelectorAll(".cal_date.isSelected").length === 1 && this._checkInputFillnes(this.firstInput) && this._checkInputFillnes(this.secondInput)){
				let activeDate = this.head_element.querySelector(".cal_date.isSelected");
				let activeDateTimestamp = this._getCellTimestamp(activeDate);
				let days = this.calendar.querySelectorAll(".cal_date.current");
				let fromChecker = true;
				if (activeDateTimestamp === this.firstSelectedDay) {fromChecker = false}
				days.forEach(day => {
				if (day === activeDate){
					fromChecker = !fromChecker;
				}
				else if (fromChecker){
					day.classList.add("additional-active");
				}
				else{
					day.classList.remove("additional-active");
				}
				});
			}
			else if (this.head_element.querySelectorAll(".cal_date.isSelected").length === 0 && this._checkInputFillnes(this.firstInput) && this._checkInputFillnes(this.secondInput)){
				let firstDate = new Date(this.firstSelectedDay);
				let secondDate = new Date(this.secondSelectedDay);
				if (this.year <= secondDate.getFullYear() && this.year >= firstDate.getFullYear() && this.month <= secondDate.getMonth() && this.month >= firstDate.getMonth()){
				let days = this.calendar.querySelectorAll(".cal_date.current");
				days.forEach(day => {
					day.classList.add("additional-active");
				});
				}
			}
			}
		
			removeMiddleSelected(){
			let days = this.calendar.querySelectorAll(".cal_date");
			days.forEach(day => {
				day.classList.remove("additional-active");
			});
			}
			
			setSelectedDate(cell){
				cell.classList.add("active");
				cell.classList.add("isSelected");
				cell.classList.remove("additional-active");
				this.setMiddleSelected();
			}
			
			getMonthStr(month){
			return this.months[Math.max(Math.min(11, month), 0)] || "Month";
			}
			
			setHeaderNav(offset){
			this.month = this.month + offset;
			if (this.month === -1) {
				this.month = 11;
				this.year--;
			} else if (this.month === 12) {
				this.month = 0;
				this.year++;
			}
			this.monthDetails = this.getMonthDetails(this.year, this.month);
			return {
				year: this.year,
				month: this.month,
				monthDetails: this.monthDetails
			};
			}
			
			setHeader(year, month){
			this.calHeaderTitle.innerHTML = this.getMonthStr(month) + " " + year;
			}
			
			fillCalendarDays(){
			this.calDays.innerHTML = "";
			for (let i = 0; i < this.days.length; i++) {
				let div = document.createElement("div");
				let span = document.createElement("span");
				div.classList.add("cell_wrapper");
				span.classList.add("cell_item");
		
				span.innerText = this.days[i].slice(0, 2);
		
				div.appendChild(span);
				this.calDays.appendChild(div);
			}
			}
			
			setCalBody(){
			this.calendar.innerHTML = "";
			let firstSelected;
			let secondSelected;
			for (let i = 0; i < this.monthDetails.length; i++) {
				let div = document.createElement("div");
				let span = document.createElement("span");
				div.classList.add("cell_wrapper");
				div.classList.add("cal_date");
				this.monthDetails[i].month === 0 && div.classList.add("current");
				//if (this.monthDetails[i].timestamp === this.todayTimestamp) {div.classList.add("inactive_indicator");}
				span.classList.add("cell_item");
				span.innerText = this.monthDetails[i].date;
				div.appendChild(span);
				this.calendar.appendChild(div);
				if (this.monthDetails[i].timestamp === this.firstSelectedDay && this.monthDetails[i].month === 0) {firstSelected = div;}
				if (this.monthDetails[i].timestamp === this.secondSelectedDay && this.monthDetails[i].month === 0) {secondSelected = div;}
			}
		
			if (firstSelected !== undefined){
				this.setSelectedDate(firstSelected);
			}
		
			if (secondSelected !== undefined){
				this.setSelectedDate(secondSelected);
			}
		
			if (secondSelected === undefined && firstSelected === undefined){
				this.setMiddleSelected();
			}
			}
			
			
			
			updateCalendar(btn){
				let newCal, offset;
				if (btn.classList.contains("back")) {
				offset = -1;
				} else if (btn.classList.contains("front")) {
				offset = 1;
				}
				newCal = this.setHeaderNav(offset);
				this.setHeader(newCal.year, newCal.month);
				this.calendar.innerHTML = "";
				this.setCalBody();
			}
		
			selectOnClick(){
			this.head_element.querySelectorAll(".cell_wrapper.current").forEach((cell) => {
				let cellTimeStamp = this._getCellTimestamp(cell);
				if (cellTimeStamp !== this.firstSelectedDay && cellTimeStamp !== this.secondSelectedDay){
				cell.classList.remove("isSelected");
				cell.classList.remove("active");
				}
		
				if(cell.classList.contains("isCurrent") && !cell.classList.contains("active")) {
				cell.querySelector("span").classList.add("inactive_indicator");
				}
			});
			}
		
			setDateToInput(timestamp, input){
				let dateString = this.getDateStringFromTimestamp(timestamp);
				if (input == this.firstInput) dateString = self.langs.utils.calendar.CAL_FROM + dateString;
				if (input == this.secondInput) dateString = self.langs.utils.calendar.CAL_TO + dateString;
				input.value = dateString;
			}
		
			getDateStringFromTimestamp(timestamp){
				let dateObject = new Date(timestamp);
				let month = dateObject.getMonth() > 8 ? dateObject.getMonth() + 1: ("0" + (dateObject.getMonth() + 1));
				let date = ("0" + dateObject.getDate()).slice(-2);
				return `${date}.${month}.${dateObject.getFullYear()}`;
			}
		
			updateInput(){
			let currentDay = this.head_element.querySelector(".isCurrent");
			this.head_element.querySelectorAll(".cell_wrapper").forEach((cell) => {
				if (cell.classList.contains("current")) {
				cell.addEventListener("click", (e) => {
					let cell_date = e.target.textContent;
			
					currentDay !== null && currentDay.classList.remove("active");
			
					for (let i = 0; i < this.monthDetails.length; i++) {
					if (this.monthDetails[i].month === 0) {
						if (this.monthDetails[i].date.toString() === cell_date) {
						if (this.checkDateSelectionDirection(this._getCellTimestamp(cell))){
							this.firstSelectedDay = this.monthDetails[i].timestamp;
							this.setDateToInput(this.firstSelectedDay, this.firstInput);
						}
						else{
							this.secondSelectedDay = this.monthDetails[i].timestamp;
							this.setDateToInput(this.secondSelectedDay, this.secondInput);
							this._closeCalendar(500);
						}
						this.selectOnClick();
						this.setSelectedDate(cell);
		
						this.inputChangedCallBack != null && this.inputChangedCallBack(this);
						
						cell.querySelector('span').classList.contains('inactive_indicator') 
						&& cell.querySelector('span').classList.remove('inactive_indicator');
						}
					}
					}
				});
				}
			});
			}
		
			checkDateSelectionDirection(cellTimeStamp){
			return !(cellTimeStamp >= this.secondSelectedDay && this.secondSelectedDay !== null) &&
					((cellTimeStamp <= this.firstSelectedDay && this.firstSelectedDay !== null && this.secondSelectedDay !== null) ||
					this.firstInput.value.replace("_", "").replace(/\D+/g, "").replace(/\./g, "").replace(" ", "").length === 0 || 
					this.firstInput.classList.contains('onFocus'));
			}
		
			_getCellTimestamp(cell){
			let day = cell.querySelector("span").innerHTML;
			return new Date(this.year, this.month, day).getTime();
			}
		
			_checkInputFillnes(input){
			return input.value.replace("_", "").replace(/\D+/g, "").replace(/\./g, "").replace(" ", "").length === 8;
			}
		
			_getTimeStampFromInput(input){
				let stringDate = input.value.replace("_", "").replace(/\D+/g, "").replace(" ", "");
				let splittedDate = stringDate.split(".");
				let date = Date.parse(splittedDate[2] + "-" + splittedDate[1] + "-" + splittedDate[0]);
				if (!isNaN(date)){
					return new Date(Number(splittedDate[2]), Number(splittedDate[1]) - 1,splittedDate[0][0] === "0" ?  Number(splittedDate[0][1]) : Number(splittedDate[0]));
				}
				else {
					return NaN;
				}
			}
		
			_closeCalendar(time){
			setTimeout(() => {
				this.head_element.querySelector('.date_picker_calendar').classList.add('hidden');
				this.head_element.querySelector('.date_picker_input').classList.remove('showCal');
			}, time);
			}
		
			getValues(){
				return {
					"firstInput" : this.firstSelectedDay,
					"secondInput" : this.secondSelectedDay
				}
			}
		
			getInputs(){
			return {
				"firstInput" : this.firstInput,
				"secondInput" : this.secondInput
			}
			}
		
			getId(){
			return this.head_element.id;
			}
		}
		return this;
    };
return CustomWidget;
});