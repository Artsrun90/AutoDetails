class Rest < Client

    def get_brands_by_oem(oem)
        path = '/backend/price_items/api/v1/search/get_brands_by_oem'
        get(path, {oem: oem})
    end
    
    def get_by_brand_and_oem(oem, brand)
        path = '/backend/price_items/api/v1/search/get_offers_by_oem_and_make_name'
        get(path, {oem: oem, make_name: brand, without_cross: true})
    end
    
end