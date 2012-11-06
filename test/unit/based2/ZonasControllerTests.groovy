package based2



import org.junit.*
import grails.test.mixin.*

@TestFor(ZonasController)
@Mock(Zonas)
class ZonasControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/zonas/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.zonasInstanceList.size() == 0
        assert model.zonasInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.zonasInstance != null
    }

    void testSave() {
        controller.save()

        assert model.zonasInstance != null
        assert view == '/zonas/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/zonas/show/1'
        assert controller.flash.message != null
        assert Zonas.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/zonas/list'

        populateValidParams(params)
        def zonas = new Zonas(params)

        assert zonas.save() != null

        params.id = zonas.id

        def model = controller.show()

        assert model.zonasInstance == zonas
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/zonas/list'

        populateValidParams(params)
        def zonas = new Zonas(params)

        assert zonas.save() != null

        params.id = zonas.id

        def model = controller.edit()

        assert model.zonasInstance == zonas
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/zonas/list'

        response.reset()

        populateValidParams(params)
        def zonas = new Zonas(params)

        assert zonas.save() != null

        // test invalid parameters in update
        params.id = zonas.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/zonas/edit"
        assert model.zonasInstance != null

        zonas.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/zonas/show/$zonas.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        zonas.clearErrors()

        populateValidParams(params)
        params.id = zonas.id
        params.version = -1
        controller.update()

        assert view == "/zonas/edit"
        assert model.zonasInstance != null
        assert model.zonasInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/zonas/list'

        response.reset()

        populateValidParams(params)
        def zonas = new Zonas(params)

        assert zonas.save() != null
        assert Zonas.count() == 1

        params.id = zonas.id

        controller.delete()

        assert Zonas.count() == 0
        assert Zonas.get(zonas.id) == null
        assert response.redirectedUrl == '/zonas/list'
    }
}
