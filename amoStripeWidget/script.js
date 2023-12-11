define(['jquery', 'underscore'], function($, _) {
    var CustomWidget = function () {
    	var self = this;

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
            if (data != null) {
                var tableHtml = '<table class="alfa_stripe_widget-table">' +
                    '<thead>' +
                    '<tr>' +
                    '<th>Payment No</th>' +
                    '<th>Payment Date</th>' +
                    '<th>Status (Stripe)</th>' +
                    '<th>Status (Alfa)</th>' +
                    '<th>Amount</th>' +
                    '</tr>' +
                    '</thead>' +
                    '<tbody>';
				console.log(tableHtml);
                $.each(data, function (index, payment) {
                    tableHtml += '<tr>' +
						'<td>' + payment.payment_no + '</td>' +
                        '<td>' + payment.payment_date + '</td>' +
                        '<td>' + payment.status_stripe + '</td>' +
                        '<td>' + payment.status_alfa + '</td>' +
                        '<td>' + payment.amount + '</td>' +
                        '</tr>';
                });

                tableHtml += '</tbody></table>';

                widget_tab.html(tableHtml);
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

			/**
			 * @description метод, вызов которого происходит при инициализации, должен вернуть массив объектов элементов, которые покажутся при фокусе на поле поиска
			 * @returns {Promise}
			 */
			loadPreloadedData: function () {
        		console.log("test1");
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