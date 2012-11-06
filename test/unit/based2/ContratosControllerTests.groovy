package based2



import org.junit.*
import grails.test.mixin.*

@TestFor(ContratosController)
@Mock(Contratos)
class ContratosControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contratos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contratosInstanceList.size() == 0
        assert model.contratosInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.contratosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contratosInstance != null
        assert view == '/contratos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contratos/show/1'
        assert controller.flash.message != null
        assert Contratos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contratos/list'

        populateValidParams(params)
        def contratos = new Contratos(params)

        assert contratos.save() != null

        params.id = contratos.id

        def model = controller.show()

        assert model.contratosInstance == contratos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contratos/list'

        populateValidParams(params)
        def contratos = new Contratos(params)

        assert contratos.save() != null

        params.id = contratos.id

        def model = controller.edit()

        assert model.contratosInstance == contratos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contratos/list'

        response.reset()

        populateValidParams(params)
        def contratos = new Contratos(params)

        assert contratos.save() != null

        // test invalid parameters in update
        params.id = contratos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contratos/edit"
        assert model.contratosInstance != null

        contratos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contratos/show/$contratos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contratos.clearErrors()

        populateValidParams(params)
        params.id = contratos.id
        params.version = -1
        controller.update()

        assert view == "/contratos/edit"
        assert model.contratosInstance != null
        assert model.contratosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contratos/list'

        response.reset()

        populateValidParams(params)
        def contratos = new Contratos(params)

        assert contratos.save() != null
        assert Contratos.count() == 1

        params.id = contratos.id

        controller.delete()

        assert Contratos.count() == 0
        assert Contratos.get(contratos.id) == null
        assert response.redirectedUrl == '/contratos/list'
    }
}
