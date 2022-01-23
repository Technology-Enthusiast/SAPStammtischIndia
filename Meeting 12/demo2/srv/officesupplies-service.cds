using {officesupplies.db as db} from '../db/schema';

service OfficeSuppliesService @(requires : 'authenticated-user') {
    entity Products @(restrict : [
        {
            grant : ['READ'],
            to    : ['ProductsViewer']
        },
        {
            grant : ['*'],
            to    : ['ProductsManager']
        }
    ])               as projection on db.Products;

    entity Suppliers @(restrict : [
        {
            grant : ['READ'],
            to    : ['SuppliersViewer']
        },
        {
            grant : ['*'],
            to    : ['SuppliersManager']
        }
    ])
        as projection on db.Suppliers;

}
