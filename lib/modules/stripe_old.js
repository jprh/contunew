const config = require('../setup/config');
const Stripe = require('stripe');

const stripe = Stripe(config.stripe.secretKey);

exports.retrieveBalance = function(options) {
    return stripe.balance.retrieve();
};

exports.retrieveBalanceTransaction = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveBalanceTransaction: id is required.');
    return stripe.balanceTransactions.retrieve(id);
};

exports.listBalanceTransactions = function(options) {
    options = this.parse(options);
    return stripe.balanceTransactions.list(options);
};

exports.createCharge = function(options) {
    options = this.parse(options);
    return stripe.charges.create(options);
};

exports.retrieveCharge = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveCharge: id is required.');
    return stripe.charges.retrieve(id);
};

exports.updateCharge = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updateCharge: id is required.');
    options = this.parse(options);
    return stripe.charges.update(id, options);
};

exports.captureCharge = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.captureCharge: id is required.');
    return stripe.charges.capture(id);
};

exports.listCharges = function(options) {
    options = this.parse(options);
    return stripe.charges.list(options);
};

exports.createCustomer = function(options) {
    options = this.parse(options);
    return stripe.customers.create(options);
};

exports.retrieveCustomer = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveCustomer: id is required.');
    return stripe.customers.retrieve(id);
};

exports.updateCustomer = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updateCustomer: id is required.');
    options = this.parse(options);
    return stripe.customers.update(id, options);
};

exports.deleteCustomer = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.deleteCustomer: id is required.');
    return stripe.customers.del(id);
};

exports.listCustomers = function(options) {
    options = this.parse(options);
    return stripe.customers.list(options);
};

exports.retrieveDispute = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveDispute: id is required.');
    return stripe.disputes.retrieve(id);
};

exports.updateCDispute = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updateCDispute: id is required.');
    options = this.parse(options);
    return stripe.disputes.update(id, options);
};

exports.closeDispute = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.closeDispute: id is required.');
    return stripe.disputes.close(id);
};

exports.listDisputes = function(options) {
    options = this.parse(options);
    return stripe.disputes.list(options);
};

exports.retrieveEvent = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveEvent: id is required.');
    return stripe.events.retrieve(id);
};

exports.listEvents = function(options) {
    options = this.parse(options);
    return stripe.events.list(options);
};

exports.createFile = function(options) {
    options = this.parse(options);
    return stripe.files.create(options);
};

exports.retrieveFile = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveFile: id is required.');
    return stripe.files.retrieve(id);
};

exports.listFiles = function(options) {
    options = this.parse(options);
    return stripe.files.list(options);
};

exports.createFileLink = function(options) {
    options = this.parse(options);
    return stripe.fileLinks.create(options);
};

exports.retrieveFileLink = function(options) {
    const stripe = getProvider(provider);
    return stripe.fileLinks.retrieve(id);
};

exports.updateFileLink = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updateFileLink: id is required.');
    options = this.parse(options);
    return stripe.fileLinks.update(id, options);
};

exports.listFileLinks = function(options) {
    options = this.parse(options);
    return stripe.fileLinks.list(options);
};

exports.retrieveMandate = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveMandate: id is required.');
    return stripe.mandates.retrieve(id);
};

exports.createPaymentIntent = function(options) {
    options = this.parse(options);
    return stripe.paymentIntents.create(options);
};

exports.retrievePaymentIntent = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrievePaymentIntent: id is required.');
    return stripe.paymentIntents.retrieve(id);
};

exports.updatePaymentIntent = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updatePaymentIntent: id is required.');
    options = this.parse(options);
    return stripe.paymentIntents.update(id, options);
};

exports.confirmPaymentIntent = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.confirmPaymentIntent: id is required.');
    options = this.parse(options);
    return stripe.paymentIntents.confirm(id, options);
};

exports.capturePaymentIntent = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.capturePaymentIntent: id is required.');
    options = this.parse(options);
    return stripe.paymentIntents.capture(id, options);
};

exports.cancelPaymentIntent = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.cancelPaymentIntent: id is required.');
    options = this.parse(options);
    return stripe.paymentIntents.cancel(id, options);
};

exports.listPaymentIntents = function(options) {
    options = this.parse(options);
    return stripe.paymentIntents.list(options);
};

exports.createSetupIntent = function(options) {
    options = this.parse(options);
    return stripe.setupIntents.create(options);
};

exports.retrieveSetupIntent = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveSetupIntent: id is required.');
    return stripe.setupIntents.retrieve(id);
};

exports.updateSetupIntent = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updateSetupIntent: id is required.');
    options = this.parse(options);
    return stripe.setupIntents.update(id, options);
};

exports.confirmSetupIntent = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.confirmSetupIntent: id is required.');
    options = this.parse(options);
    return stripe.setupIntents.confirm(id, options);
};

exports.cancelSetupIntent = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.cancelSetupIntent: id is required.');
    options = this.parse(options);
    return stripe.setupIntents.cancel(id, options);
};

exports.listSetupIntents = function(options) {
    options = this.parse(options);
    return stripe.setupIntents.list(options);
};

exports.listSetupAttempts = function(options) {
    options = this.parse(options);
    return stripe.setupAttempts.list(options);
};

exports.createPayout = function(options) {
    options = this.parse(options);
    return stripe.payouts.create(options);
};

exports.retrievePayout = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrievePayout: id is required.');
    return stripe.payouts.retrieve(id);
};

exports.updatePayout = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updatePayout: id is required.');
    options = this.parse(options);
    return stripe.payouts.update(id, options);
};

exports.listPayouts = function(options) {
    options = this.parse(options);
    return stripe.payouts.list(options);
};

exports.cancelPayout = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.cancelPayout: id is required.');
    return stripe.payouts.cancel(id);
};

exports.createProduct = function(options) {
    options = this.parse(options);
    return stripe.products.create(options);
};

exports.retrieveProduct = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveProduct: id is required.');
    return stripe.products.retrieve(id);
};

exports.updateProduct = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updateProduct: id is required.');
    options = this.parse(options);
    return stripe.products.update(id, options);
};

exports.listProducts = function(options) {
    options = this.parse(options);
    return stripe.products.list(options);
};

exports.deleteProduct = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.deleteProduct: id is required.');
    return stripe.products.del(id);
};

exports.createPrice = function(options) {
    options = this.parse(options);
    return stripe.prices.create(options);
};

exports.retrievePrice = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrievePrice: id is required.');
    return stripe.prices.retrieve(id);
};

exports.updatePrice = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updatePrice: id is required.');
    options = this.parse(options);
    return stripe.prices.update(id, options);
};

exports.listPrices = function(options) {
    options = this.parse(options);
    return stripe.prices.list(options);
};

exports.createRefund = function(options) {
    options = this.parse(options);
    return stripe.refunds.create(options);
};

exports.retrieveRefund = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveRefund: id is required.');
    return stripe.refunds.retrieve(id);
};

exports.updateRefund = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updateRefund: id is required.');
    options = this.parse(options);
    return stripe.refunds.update(id, options);
};

exports.listRefunds = function(options) {
    options = this.parse(options);
    return stripe.refunds.list(options);
};

exports.createCardToken = function(options) {
    options = this.parse(options);
    return stripe.tokens.create({ card: options });
};

exports.createBankAccountToken = function(options) {
    options = this.parse(options);
    return stripe.tokens.create({ bank_account: options });
};

exports.createPIIToken = function(options) {
    options = this.parse(options);
    return stripe.tokens.create({ pii: options });
};

exports.createAccountToken = function(options) {
    options = this.parse(options);
    return stripe.tokens.create({ account: options });
};

exports.createPersonToken = function(options) {
    options = this.parse(options);
    return stripe.tokens.create({ person: options });
};

exports.createCVCUpdateToken = function(options) {
    options = this.parse(options);
    return stripe.tokens.create({ cvc_update: options });
};

exports.retrieveToken = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveToken: id is required.');
    return stripe.tokens.retrieve(id);
};

exports.createPaymentMethod = function(options) {
    options = this.parse(options);
    return stripe.paymentMethods.create(options);
};

exports.retrievePaymentMethod = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrievePaymentMethod: id is required.');
    return stripe.paymentMethods.retrieve(id);
};

exports.updatePaymentMethod = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updatePaymentMethod: id is required.');
    options = this.parse(options);
    return stripe.paymentMethods.update(id, options);
};

exports.listPaymentMethods = function(options) {
    options = this.parse(options);
    return stripe.paymentMethods.list(options);
};

exports.attachPaymentMethod = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.attachPaymentMethod: id is required.');
    options = this.parse(options);
    return stripe.paymentMethods.attach(id, options);
};

exports.detachPaymentMethod = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.detachPaymentMethod: id is required.');
    return stripe.paymentMethods.detach(id);
};

exports.createBankAccount = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.createBankAccount: customer is required.');
    options = this.parse(options);
    return stripe.customers.createSource(customer, options);
};

exports.retrieveBankAccount = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.retrieveBankAccount: customer is required.');
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveBankAccount: id is required.');
    return stripe.customers.retrieveSource(customer, id);
};

exports.updateBankAccount = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.updateBankAccount: customer is required.');
    const id = this.parseRequired(options.id, 'string', 'stripe.updateBankAccount: id is required.');
    options = this.parse(options);
    return stripe.customers.updateSource(customer, id, options);
};

exports.verifyBankAccount = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.verifyBankAccount: customer is required.');
    const id = this.parseRequired(options.id, 'string', 'stripe.verifyBankAccount: id is required.');
    options = this.parse(options);
    return stripe.customers.verifySource(customer, id, options);
};

exports.deleteBankAccount = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.deleteBankAccount: customer is required.');
    const id = this.parseRequired(options.id, 'string', 'stripe.deleteBankAccount: id is required.');
    return stripe.customers.deleteSource(customer, id);
};

exports.listBankAccounts = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.listBankAccounts: customer is required.');
    return stripe.customers.listSources(customer, { object: 'bank_account', ...options });
};

exports.createCard = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.createCard: customer is required.');
    options = this.parse(options);
    return stripe.customers.createSource(customer, options);
};

exports.retrieveCard = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.retrieveCard: customer is required.');
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveCard: id is required.');
    return stripe.customers.retrieveSource(customer, id);
};

exports.updateCard = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.updateCard: customer is required.');
    const id = this.parseRequired(options.id, 'string', 'stripe.updateCard: id is required.');
    options = this.parse(options);
    return stripe.customers.updateSource(customer, id, options);
};

exports.deleteCard = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.deleteCard: customer is required.');
    const id = this.parseRequired(options.id, 'string', 'stripe.deleteCard: id is required.');
    return stripe.customers.deleteSource(customer, id);
};

exports.listCards = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.listCards: customer is required.');
    options = this.parse(options);
    return stripe.customers.listSources(customer, { object: 'card', ...options });
};

exports.createSource = function(options) {
    options = this.parse(options);
    return stripe.sources.create(options);
};

exports.retrieveSource = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveSource: id is required.');
    return stripe.sources.retrieve(id);
};

exports.updateSource = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updateSource: id is required.');
    options = this.parse(options);
    return stripe.sources.update(id, options);
};

exports.attachSource = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.attachSource: customer is required.');
    options = this.parse(options);
    return stripe.customers.createSource(customer, options);
};

exports.detachSource = function(options) {
    const customer = this.parseRequired(options.customer, 'string', 'stripe.detachSource: customer is required.');
    const id = this.parseRequired(options.id, 'string', 'stripe.detachSource: id is required.');
    return stripe.customers.deleteSource(customer, id);
};

exports.createSession = function(options) {
    options = this.parse(options);
    return stripe.checkout.sessions.create(options);
};

exports.retrieveSession = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveSession: id is required.');
    return stripe.checkout.sessions.retrieve(id);
};

exports.listSessions = function(options) {
    options = this.parse(options);
    return stripe.checkout.sessions.list(options);
};

exports.listSessionsLineItems = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.listSessionsLineItems: id is required.');
    options = this.parse(options);
    return stripe.checkout.sessions.listLineItems(id, options);
};

exports.createCoupon = function(options) {
    options = this.parse(options);
    return stripe.coupons.create(options);
};

exports.retrieveCoupon = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveCoupon: id is required.');
    return stripe.coupons.retrieve(id);
};

exports.updateCoupon = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updateCoupon: id is required.');
    options = this.parse(options);
    return stripe.coupons.update(id, options);
};

exports.deleteCoupon = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.deleteCoupon: id is required.');
    return stripe.coupons.del(id);
};

exports.listCoupons = function(options) {
    options = this.parse(options);
    return stripe.coupons.list(options);
};

exports.previewCreditNote = function(options) {
    options = this.parse(options);
    return stripe.creditNotes.preview(options);
};

exports.createCreditNote = function(options) {
    options = this.parse(options);
    return stripe.creditNotes.create(options);
};

exports.retrieveCreditNote = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveCreditNote: id is required.');
    return stripe.creditNotes.retrieve(id);
};

exports.updateCreditNote = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updateCreditNote: id is required.');
    options = this.parse(options);
    return stripe.creditNotes.update(id, options);
};

exports.listCreditNoteLineItems = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.listCreditNoteLineItems: id is required.');
    options = this.parse(options);
    return stripe.creditNotes.listLineItems(id, options);
};

exports.listPreviewCreditNoteLineItems = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.listPreviewCreditNoteLineItems: id is required.');
    options = this.parse(options);
    return stripe.creditNotes.listPreviewLineItems(id, options);
};

exports.voidCreditNote = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.voidCreditNote: id is required.');
    return stripe.creditNotes.voidCreditNote(id);
};

exports.listCreditNotes = function(options) {
    options = this.parse(options);
    return stripe.creditNotes.list(options);
};

// ---------------------------------------------------

exports.createOrder = function(options) {
    options = this.parse(options);
    return stripe.orders.create(options);
};

exports.retrieveOrder = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveOrder: id is required.');
    return stripe.orders.retrieve(id);
};

exports.updateOrder = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updateOrder: id is required.');
    options = this.parse(options);
    return stripe.orders.update(id, options);
};

exports.payOrder = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.payOrder: id is required.');
    options = this.parse(options);
    return stripe.orders.pay(id, options);
};

exports.listOrders = function(options) {
    options = this.parse(options);
    return stripe.orders.list(options);
};

exports.returnOrder = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.returnOrder: id is required.');
    options = this.parse(options);
    return stripe.orders.returnOrder(id, options);
};

exports.retrieveOrderReturn = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveOrderReturn: id is required.');
    return stripe.orderReturns.retrieve(id);
};

exports.listOrderReturns = function(options) {
    options = this.parse(options);
    return stripe.orderReturns.list(options);
};

exports.createSku = function(options) {
    options = this.parse(options);
    return stripe.skus.create(options);
};

exports.retrieveSku = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.retrieveSku: id is required.');
    return stripe.skus.retrieve(id);
};

exports.updateSku = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.updateSku: id is required.');
    options = this.parse(options);
    return stripe.skus.update(id, options);
};

exports.listSkus = function(options) {
    options = this.parse(options);
    return stripe.skus.list(options);
};

exports.deleteSku = function(options) {
    const id = this.parseRequired(options.id, 'string', 'stripe.deleteSku: id is required.');
    return stripe.skus.del(id);
};