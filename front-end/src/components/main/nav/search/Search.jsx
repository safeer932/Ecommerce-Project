import './Search.css';
import './SearchQuerties.css';
import React, { useState, useRef } from 'react';
import { useDispatch } from 'react-redux';
import { IoSearchSharp } from 'react-icons/io5';

const Search = () => {
    const [searchErrMsg, setSearchErrMsg] = useState('What are you looking for?');
    const [isBtn, setIsBtn] = useState(true);
    const searchInput = useRef(null);
    const dispatch = useDispatch();
    const axios = require('axios');

    const isValid = (e) => { // Search validation
        e.preventDefault();

        if (e.target.search.value.length > 0) {
            searchHandler(e.target.search.value);
        }
    }

    const searchHandler = async (productName) => { // Fetch product by searched name
        try {
            const res = await axios.post(`${process.env.REACT_APP_BACKEND_URL}/stock`,
            {productName: productName});
            
            if (Array.isArray(res.data.data) && res.data.data.length > 0) {
                window.history.replaceState(null, '', `search=${productName}`);
                dispatch({type: 'SET_PRODUCTS', products: res.data.data});
                dispatch({type: 'SET_SEARCH_STATUS', searchStatus: {searchWord: searchInput.current.value, resultsNumber: res.data.data.length} });
            } else {
                setSearchErrMsg(res.data.data);
                setTimeout(() => { setSearchErrMsg('What are you looking for?'); }, 80);
                searchInput.current.value = '';
                setIsBtn(true);
            }
        } catch (err) {
            console.error(err);
        }
    }

    return (
        <form onSubmit={isValid} className='search-form' autoComplete='off'>
            <div className='search-box'>
                <input 
                    type='search' 
                    name='search' 
                    maxLength='50'
                    placeholder={searchErrMsg} 
                    ref={searchInput}
                    onChange={(e) => {
                        if (e.target.value) {
                            setIsBtn(false);
                        } else {
                            setIsBtn(true);
                        }
                    }}
                />
            </div>

            <div className='btn-box'>
                <button type='submit' disabled={isBtn}>
                    <span><IoSearchSharp /></span>
                </button>
            </div>
        </form> 
    );
}

export default Search;
