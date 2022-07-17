local id = 'GEE_catalog';
local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';

local basename = 'catalog';
local base_filename = basename + '.json';
local base_url = ee_const.catalog_base + '';
// No parent url as this is the root.
local self_url = base_url + base_filename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.catalog,
  id: id,
  title: 'Google Earth Engine Catalog',
  description: importstr 'description.md',
  links: [
    ee.link.root(),
    // No parent url as this is the root.
    ee.link.self_link(self_url),

    ee.link.child_catalog('AAFC', base_url),
    ee.link.child_catalog('ACA', base_url),
    ee.link.child_catalog('AHN', base_url),
    ee.link.child_catalog('ASTER', base_url),
    ee.link.child_catalog('AU', base_url),
    ee.link.child_catalog('BIOPAMA', base_url),
    ee.link.child_catalog('BLM', base_url),
    ee.link.child_catalog('CAS', base_url),
    ee.link.child_catalog('CGIAR', base_url),
    ee.link.child_catalog('CIESIN', base_url),
    ee.link.child_catalog('COPERNICUS', base_url),
    ee.link.child_catalog('CPOM', base_url),
    ee.link.child_catalog('CSIRO', base_url),
    ee.link.child_catalog('CSP', base_url),
    ee.link.child_catalog('DLR', base_url),
    ee.link.child_catalog('DOE', base_url),
    ee.link.child_catalog('ECMWF', base_url),
    ee.link.child_catalog('EO1', base_url),
    ee.link.child_catalog('EPA', base_url),
    ee.link.child_catalog('ESA', base_url),
    ee.link.child_catalog('FAO', base_url),
    ee.link.child_catalog('FIRMS', base_url),
    ee.link.child_catalog('FORMA', base_url),
    ee.link.child_catalog('GFW', base_url),
    ee.link.child_catalog('GLCF', base_url),
    ee.link.child_catalog('GLIMS', base_url),
    ee.link.child_catalog('GLOBAL_FLOOD_DB', base_url),
    ee.link.child_catalog('GOOGLE', base_url),
    ee.link.child_catalog('GRIDMET', base_url),
    ee.link.child_catalog('HYCOM', base_url),
    ee.link.child_catalog('IDAHO_EPSCOR', base_url),
    ee.link.child_catalog('ISDASOIL', base_url),
    ee.link.child_catalog('JAXA', base_url),
    ee.link.child_catalog('JCU', base_url),
    ee.link.child_catalog('JRC', base_url),
    ee.link.child_catalog('KNTU', base_url),
    ee.link.child_catalog('LANDFIRE', base_url),
    ee.link.child_catalog('LANDSAT', base_url),
    ee.link.child_catalog('LARSE', base_url),
    ee.link.child_catalog('MERIT', base_url),
    ee.link.child_catalog('MODIS', base_url),
    ee.link.child_catalog('NASA', base_url),
    ee.link.child_catalog('NASA_USDA', base_url),
    ee.link.child_catalog('NCEP_RE', base_url),
    ee.link.child_catalog('NOAA', base_url),
    ee.link.child_catalog('NRCan', base_url),
    ee.link.child_catalog('OREGONSTATE', base_url),
    ee.link.child_catalog('OSU', base_url),
    ee.link.child_catalog('OpenLandMap', base_url),
    ee.link.child_catalog('Oxford', base_url),
    ee.link.child_catalog('RESOLVE', base_url),
    ee.link.child_catalog('SKYSAT', base_url),
    ee.link.child_catalog('SNU', base_url),
    ee.link.child_catalog('TERN', base_url),
    ee.link.child_catalog('TIGER', base_url),
    ee.link.child_catalog('TOMS', base_url),
    ee.link.child_catalog('TRMM', base_url),
    ee.link.child_catalog('TUBerlin', base_url),
    ee.link.child_catalog('Tsinghua', base_url),
    ee.link.child_catalog('UCSB-CHG', base_url),
    ee.link.child_catalog('UMD', base_url),
    ee.link.child_catalog('UMN', base_url),
    ee.link.child_catalog('UMT', base_url),
    ee.link.child_catalog('UQ', base_url),
    ee.link.child_catalog('USDA', base_url),
    ee.link.child_catalog('USDOS', base_url),
    ee.link.child_catalog('USFS', base_url),
    ee.link.child_catalog('USGS', base_url),
    ee.link.child_catalog('UTOKYO', base_url),
    ee.link.child_catalog('VITO', base_url),
    ee.link.child_catalog('WCMC', base_url),
    ee.link.child_catalog('WHBU', base_url),
    ee.link.child_catalog('WHRC', base_url),
    ee.link.child_catalog('WORLDCLIM', base_url),
    ee.link.child_catalog('WRI', base_url),
    ee.link.child_catalog('WWF', base_url),
    ee.link.child_catalog('WorldPop', base_url),
    ee.link.child_catalog('YALE', base_url),
    ee.link.child_catalog('planet-nicfi', base_url),
  ],
}
