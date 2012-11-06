package based2



import org.junit.*
import grails.test.mixin.*

@TestFor(PagosController)
@Mock(Pagos)
class PagosControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pagos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pagosInstanceList.size() == 0
        assert model.pagosInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pagosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pagosInstance != null
        assert view == '/pagos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pagos/show/1'
        assert controller.flash.message != null
        assert Pagos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pagos/list'

        populateValidParams(params)
        def pagos = new Pagos(params)

        assert pagos.save() != null

        params.id = pagos.id

        def model = controller.show()

        assert model.pagosInstance == pagos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pagos/list'

        populateValidParams(params)
        def pagos = new Pagos(params)

        assert pagos.save() != null

        params.id = pagos.id

        def model = controller.edit()

        assert model.pagosInstance == pagos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pagos/list'

        response.reset()

        populateValidParams(params)
        def pagos = new Pagos(params)

        assert pagos.save() != null

        // test invalid parameters in update
        params.id = pagos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pagos/edit"
        assert model.pagosInstance != null

        pagos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pagos/show/$pagos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pagos.clearErrors()

        populateValidParams(params)
        params.id = pagos.id
        params.version = -1
        controller.update()

        assert view == "/pagos/edit"
        assert model.pagosInstance != null
        assert model.pagosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pagos/list'

        response.reset()

        populateValidParams(params)
        def pagos = new Pagos(params)

        assert pagos.save() != null
        assert Pagos.count() == 1

        params.id = pagos.id

        controller.delete()

        assert Pagos.count() == 0
        assert Pagos.get(pagos.id) == null
        assert response.redirectedUrl == '/pagos/list'
    }
}
