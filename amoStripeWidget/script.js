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

		this.callbacks = {
			render: function(){
				console.log('render');
                return true;
			},
			destroy: function(){

			},
			init: function(){
				console.log('init');
				return true;
			},
			bind_actions: function(){
				console.log('bind_actions');
				return true;
			},
			onSave: function() {
				return true;
			},
			settings: function () {
				$('.js-widget-save').trigger('button:save:enable');
				return true;
			},

			initMenuPage: function (params) {
				console.log("test");
				switch (params.location) {
				  case 'stats':
					switch (params.subitem_code) {
					  case 'custom_submenu_stripe_data':
						self.getTemplate(
						  'stats__sub_item_1',
						  {},
						  function (template) {
							$('#work-area-' + self.get_settings().widget_code).html('Пункт Аналитика, подпункт нужный');
						  });
						break;
			  
					  case 'sub_item_2':
						self.getTemplate(
						  'stats__sub_item_2',
						  {},
						  function (template) {
							$('#work-area-' + self.get_settings().widget_code).html('Пункт Аналитика, подпункт 2');
						  });
						break;
					}
					break;
				}
			},

			/**
			 * @description метод, вызов которого происходит при инициализации, должен вернуть массив объектов элементов, которые покажутся при фокусе на поле поиска
			 * @returns {Promise}
			 */
			loadPreloadedData: function () {
        		console.log("test1");
				//console.log(self);
				//console.log(langs);
				//console.log(self.i18n('userLang'));
				var amoDomain = AMOCRM.widgets.system.domain;
				var amoId = AMOCRM.data.current_card.id;

				let widget_code = self.get_settings().widget_code;
				console.log($(`.card-tabs__item[data-id="${widget_code}"] span`));
				console.log('Widget Code:', widget_code);
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
					console.log('Fetched Data:', data);
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
       			console.log("test2");
				return Promise.resolve({});
			},

			/**
			 * @param links - массив данных о привязке или отвязке элементов от сущности
			 * @description метод, вызов которого происходит при сохранении привязки или отвязке сущности от карточки
			 * @returns {Promise}
			 */
			linkCard: function (links) {
        		console.log("test3");
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
        		console.log("test4");
				return Promise.resolve({});
			}
		};
		return this;
    };

return CustomWidget;
});