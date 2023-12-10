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

		function updateLeadView(data) {
            if (data && data.db && data.payment_calendar) {
                var tableHtml = '<table border="1">' +
                    '<thead>' +
                    '<tr>' +
                    '<th>ID</th>' +
                    '<th>User ID</th>' +
                    '<th>Stripe Subscription ID</th>' +
                    '<th>Status (Stripe)</th>' +
                    '<th>Status (Alfa)</th>' +
                    '<th>Payment Date</th>' +
                    '<th>Payment No</th>' +
                    '<th>Amount</th>' +
                    '</tr>' +
                    '</thead>' +
                    '<tbody>';

                $.each(data.payment_calendar, function (index, payment) {
                    tableHtml += '<tr>' +
                        '<td>' + payment.id + '</td>' +
                        '<td>' + payment.user_id + '</td>' +
                        '<td>' + payment.stripe_subscription_id + '</td>' +
                        '<td>' + payment.status_stripe + '</td>' +
                        '<td>' + payment.status_alfa + '</td>' +
                        '<td>' + payment.payment_date + '</td>' +
                        '<td>' + payment.payment_no + '</td>' +
                        '<td>' + payment.amount + '</td>' +
                        '</tr>';
                });

                tableHtml += '</tbody></table>';

                // Append the new table to the lead view
                $('.card-top').append(tableHtml);
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
				var amoDomain = AMOCRM.widgets.system.amo_domain;
				var amoId = AMOCRM.data.current_card.id;

				return new Promise(_.bind(function (resolve, reject) {
					self.crm_post(
						'https://alfa-amo.ru/stripe_widget/customer_payment_calendar.php?amo_domain' + amoDomain + '&amo_id=' + amoId,
						{},
						function (msg) {
							console.log(AMOCRM.current_card);
							console.log(msg);
							resolve(msg);
						},
						'json'
					);
				}), this);
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