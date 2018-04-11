require 'transfeera_sdk/base'

module TransfeeraSDK
  class Bank < TransfeeraSDK::Base
    BANKS_LIST = [{ 'id' => 4,  'name' => 'Bradesco',                              'code' => '237' },
                  { 'id' => 6,  'name' => 'Banco do Brasil',                       'code' => '001' },
                  { 'id' => 3,  'name' => 'Caixa Econômica',                       'code' => '104' },
                  { 'id' => 1,  'name' => 'Santander',                             'code' => '033' },
                  { 'id' => 5,  'name' => 'Itaú',                                  'code' => '341' },
                  { 'id' => 26, 'name' => 'Banco Safra',                           'code' => '422' },
                  { 'id' => 25, 'name' => 'Banco Inter',                           'code' => '077' },
                  { 'id' => 24, 'name' => 'Banestes',                              'code' => '021' },
                  { 'id' => 23, 'name' => 'Daycoval',                              'code' => '707' },
                  { 'id' => 22, 'name' => 'Mercantil do Brasil',                   'code' => '389' },
                  { 'id' => 21, 'name' => 'Agiplan',                               'code' => '121' },
                  { 'id' => 20, 'name' => 'Banco do Nordeste',                     'code' => '004' },
                  { 'id' => 19, 'name' => 'Unicred',                               'code' => '136' },
                  { 'id' => 16, 'name' => 'Citibank',                              'code' => '745' },
                  { 'id' => 15, 'name' => 'neon',                                  'code' => '735' },
                  { 'id' => 14, 'name' => 'Banco Sofisa',                          'code' => '637' },
                  { 'id' => 13, 'name' => 'Nu Pagamentos S.A.',                    'code' => '260' },
                  { 'id' => 12, 'name' => 'Original',                              'code' => '212' },
                  { 'id' => 11, 'name' => 'Cooperativa Central de Crédito Urbano', 'code' => '085' },
                  { 'id' => 10, 'name' => 'Banco de Brasília - BRB',               'code' => '070' },
                  { 'id' => 9,  'name' => 'Banrisul',                              'code' => '041' },
                  { 'id' => 8,  'name' => 'Sicredi',                               'code' => '748' },
                  { 'id' => 7,  'name' => 'Sicoob',                                'code' => '756' },
                  { 'id' => 27, 'name' => 'Banco Parana',                          'code' => '254' },
                  { 'id' => 28, 'name' => 'Votorantin',                            'code' => '655' }]
    def list
      send_request(:get, '/bank')
    end

    def destination_bank_account
      send_request(:get, 'destinationBankAccount')
    end

    def bank_id_from_code(code)
      BANKS_LIST.each { |bank| return bank['id'] if bank['code'] == code }

      nil
    end
  end
end
