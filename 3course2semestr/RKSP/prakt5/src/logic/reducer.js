const initialState = {
    agreementAccepted: false
};

const reducer = (state = initialState, action) => {
    switch (action.type) {
        case 'TOGGLE_AGREEMENT':
            return {
                ...state,
                agreementAccepted: !state.agreementAccepted
            };
        default:
            return state;
    }
};

export default reducer;